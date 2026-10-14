---
comments: true
created: '2026-10-14T12:52:30'
draft: true
modified: '2026-10-14T12:52:30'
source: https://github.blog/open-source/git/highlights-from-git-2-56/
title: Highlights from Git 2.56
type: archive-web
---

The open source Git project just released Git 2.56.0 with features and bug
fixes from over 104 contributors, 39 of them new. We last caught up with you
on the latest in Git [back when 2.55 was released](https://github.blog/open-
source/git/highlights-from-git-2-55/).

To celebrate this most recent release, here is GitHub’s look at some of the
most interesting features and changes introduced since last time.

## Stage resolved conflicts without staging everything else

Resolving a merge conflict has two distinct parts. First, you edit the working
tree until each conflicted path contains the result you want. Then, you stage
those paths to tell Git that the conflict is resolved.

Suppose a merge conflicts in `recipe.txt`, while `notes.txt` contains an
unrelated local edit.

The second step sounds simple, but existing commands make it easy to stage
more than you intended. `git add -u` updates every modified tracked path.
During a merge, that may include local changes that are unrelated to the
conflict. It can also stage a file that still contains conflict markers if you
overlooked one.

Git 2.56 provides a safer workflow:

    
    
    $ git add --resolved
    fatal: the following paths still have conflict markers:
            recipe.txt
    
    $ # Edit recipe.txt and remove the conflict markers.
    $ git add --resolved
    $ git status --short
     M notes.txt
    M  recipe.txt

The new `git add --resolved` mode is designed specifically for this step. It
considers only paths that are currently unmerged in the index. Before staging
anything, it scans unmerged regular files for leftover conflict markers. If it
finds one, it reports the affected paths and leaves the index unchanged.

The two columns in `git status --short` distinguish staged and unstaged
changes. `recipe.txt` is staged as resolved, while the unrelated change to
`notes.txt` remains unstaged.

You can also pass a pathspec to limit which unmerged paths are considered. The
all-or-nothing marker check still applies within that selection: if any
selected regular file contains conflict markers, Git stages none of them.
Resolved deletions and binary conflicts do not have textual markers, so Git
can stage them normally.

This is intentionally narrower than `git add -u` or `git add -A`. `--resolved`
cannot be combined with either mode, and it ignores tracked files that were
never conflicted. That makes it a useful safety rail for maintainer workflows
where a merge may begin with unrelated local changes already present.

[[source](https://github.com/git/git/compare/9a0c4701dcd5725c4184599322b52933ff5005ca...94cf62176ec5e416b7748d60b59bf8f6aa6dd7b3),
[discussion](https://lore.kernel.org/git/20260731125605.3638938-5-gitster@pobox.com/)]

## Stop searching history once no more merge bases can exist

Many Git operations need to find the best common ancestor(s) of two commits.
Merges use them as the starting point for combining changes, while three-dot
diffs use a best common ancestor to decide where a topic branch’s work begins.
Repository hosts perform the same calculation for pull request diffs,
mergeability checks, review ranges, and other comparisons.

Git finds these common ancestors by walking backward from both tips. Imagine
painting commits reachable from one side blue and commits from the other side
red. A commit reached by both colors is a merge-base candidate.

Finding one candidate is not necessarily enough. Criss-cross merges can
produce multiple merge bases, none of which is an ancestor of another, so Git
must keep walking until it knows that it has found all of them. But the old
stopping rule could keep processing a long tail of stale, already-common
history after another merge base had become impossible.

Git 2.56 tracks how many queued commits remain painted exclusively by each
side. The implementation has additional guards around this rule, but at a high
level once one exclusive side is exhausted, no new meeting point can appear.
Git can stop while still returning every merge base.

![An animation finds two merge bases before one paint side becomes empty. Git
2.56 then stops, while earlier Git continues walking a large already-common
region even though no additional merge base can form.](https://github.blog/wp-
content/uploads/2026/09/657850736-08c69f71-39c2-42ed-b793-cc07f6d29a89.png?resize=1024%2C597)

The difference can be dramatic when old side branches have been merged into a
much longer history. In one real monorepo case, the traversal fell from 0.68
seconds to 0.01 seconds. Production evaluations on two large monorepos found
many cases around 70 times faster in one and an average improvement around 20
times in the other.

The final series also fixed a long-standing Linux-kernel performance case.
With Git’s default v2 commit-graph, the command `git merge-base --all v4.8
v4.9` fell from 167,441 traversal steps and 0.29 seconds to 3,887 steps and
0.01 seconds.

[[source](https://github.com/git/git/compare/e8e7bf97fe55adee95fc46550b9667d7c27da1d5...56c9056e30812bbba545d95ed7eb0f5beb089edd)]

## Make smaller path-walk repacks practical for servers

When Git repacks a repository, it searches for similar objects that can be
stored efficiently as deltas. The traditional search groups candidates using a
name hash. Path-walk repacking instead visits objects by their location in the
tree, bringing versions of the same path together and often finding much
better delta relationships.

The potential storage savings are substantial. In a benchmark using a recent
clone of [the Fluent UI repository](https://github.com/microsoft/fluentui) and
forcing Git to recompute deltas, an ordinary bitmapped repack produced a 558.5
MB pack. Repacking with `--path-walk` produced a 164.4 MB pack, about 71%
smaller.

But repository hosts need more than small packs. They commonly use
reachability bitmaps to answer object-enumeration queries quickly, and some
use delta islands to prevent objects in one group of refs from depending on
objects available only in another. Path-walk repacking was incompatible with
both, limiting where its storage improvements could be deployed.

Git 2.56 removes those two restrictions. A path-walk repack can now select
commits for a new bitmap. Later `git pack-objects` invocations can reuse an
existing bitmap when it answers the request, falling back to the path walk
only when necessary.

Path-walk also now performs the bookkeeping required by delta islands:
propagating island membership through commits and trees before choosing delta
bases. That lets hosts preserve their isolation rules while experimenting with
path-walk’s smaller on-disk representation.

These changes do not enable path-walk repacking by default. Instead, they
remove two important adoption blockers, making it possible for large
repository hosts to evaluate the storage savings without giving up fast
bitmap-assisted serving or delta-island constraints.

[[source](https://github.com/git/git/commit/0a374511064bad27f707cb9f03448fb8aa25791f),
[source](https://github.com/git/git/commit/7e6de2ac62817199a2c8dd464f9e33ae0b4966e3)]

## The tip of the iceberg…

Those are just a few of the changes in Git 2.56. Here are some other new  
features and updates worth highlighting.

  * The experimental `git history` command continues to grow. Git 2.54 introduced it with `reword` and `split`, and Git 2.55 added `fixup`. Git 2.56 adds:

`$ git history drop <commit>`

The command removes the selected commit and replays its descendants onto the
commit’s parent. If `HEAD` moves, Git updates the index and working tree while
preserving unrelated local changes. It aborts if replaying a descendant would
conflict or overwrite a local change. The command remains experimental, cannot
operate on a history that contains merge commits, and cannot drop a root or
merge commit.

[[source](https://github.com/git/git/compare/1666c1265231b0bc5f613fbbf3f0a9896cdef76e...d11b348f7840c7ae4aba5d273ff56c813475a88e)]

  * Reference-writing commands have historically been scattered across `git update-ref`, `git symbolic-ref`, and other plumbing. Git 2.56 continues consolidating low-level reference management under the `git refs` toolbox:

`$ git refs create refs/heads/topic <new-value>`  
`$ git refs update refs/heads/topic <new-value> [<old-value>]`  
`$ git refs delete refs/heads/topic [<old-value>]`  
`$ git refs rename refs/heads/old refs/heads/new`

Optional old values provide compare-and-swap protection for updates and
deletion. These are deliberately low-level commands. In particular, `git refs
rename` moves the ref and its reflog, but does not perform the branch
configuration adjustments that `git branch -m` does.

[[source](https://github.com/git/git/compare/0fae78c9d55efe705877ea537fe42c59164ccd94...002fe677caddc8162949315c73e53422d4e0f4e8)]

  * Cleaning up local topic branches after their work lands upstream can involve comparing each branch to its configured remote-tracking branch. Git 2.56 adds a bulk form:

`$ git branch --delete-merged 'origin/*' 'topic-*' --dry-run`

In this command, `origin/*` matches branches whose upstream is under `origin`,
`topic-*` limits the candidates to local branch names beginning with `topic-`,
and `--dry-run` lists what would be deleted without deleting anything.

When run without `--dry-run`, Git deletes only branches whose tips are
reachable from their matching upstreams. Branches checked out in a worktree,
branches with missing upstreams, and several ambiguous push configurations are
skipped. `branch.<name>.deleteMerged = false` can protect a branch from bulk
cleanup.

[[source](https://github.com/git/git/compare/876029beca8495a44e3b6c335b7fac5208e8da86...25285a6763543242514f3a58c504fd80e9996df2)]

  * `git bisect run` is wonderfully effective at finding the commit that introduced a regression, but when it finishes it normally leaves you checked out at the culprit until you run `git bisect reset`. The new `--reset-when-found[=<where>]` option combines those steps. Its default is `original`, which returns to the commit checked out before the bisection began; `found` cleans up the bisection state but leaves the culprit checked out. The option is unavailable with `--no-checkout`.

[[source](https://github.com/git/git/compare/41365c2a9ba347870b80881c0d67454edd22fd49...f70281521a06894e51b5acfa9abbbb884c05d980)]

  * The experimental `git replay` command can now flatten merge topology with `--linearize`. Git replays the commits in a single line and drops merge commits, matching the topology produced by `git rebase --no-rebase-merges`, but without using the working tree. The option cannot be combined with `--contained` or with replaying multiple branches at once.

[[source](https://github.com/git/git/compare/13c7afec212fc97ce257d15601659314c6673d6c...354c736978bdc7a1d0bb0f19b81060182a374be6)]

  * Git can now recognize two easy command-line slips and suggest the intended form. Running `git push origin/main` advises using `git push origin main`, while `git branch --set-upstream-to origin main` suggests `git branch --set-upstream-to=origin/main`. Git checks that each correction is plausible before suggesting it, avoiding indiscriminate guesses.

[[source](https://github.com/git/git/compare/431cacf73dc3cadc84e86514d7a0a6038a87f2bc...a85a43c4802c124a504c42c63129a97d7f8346c1)]

  * Partial clones omit selected objects initially, but blobs fetched on demand have traditionally remained stored locally forever. Git 2.56 can discard large, recoverable blobs and rely on the promisor remote again:

`$ git repack -a --filter=blob:limit=1m --drop-filtered --dry-run`  
`$ git repack -a --filter=blob:limit=1m --drop-filtered`

The dry run lists candidates; the real repack removes them locally so a later
access fetches them again. This is a manual cleanup mechanism, not an
automatically bounded cache, and currently supports only `blob:limit` filters.
Git requires a promisor remote and refuses unsafe cases such as dropping an
object referenced by the current index. The work was contributed as a GSoC
project by Siddharth Shrimali, with Christian Couder and Siddharth Asthana
recorded as mentors.

[[source](https://github.com/git/git/compare/2c3adbb2c475981e340c79fdc5e7f4f9b5d9054e...c6fed8b7a674840c5fc698c9aa1ddd9b8cc9b97d),
[discussion](https://lore.kernel.org/git/20260813200830.84348-1-r.siddharth.shrimali@gmail.com/)]

  * `git log --follow` can now track a path more reliably through non-linear history. Previously, the command kept one global “current path.” If different parents renamed the path differently, whichever side happened to be visited first could determine what Git followed through the rest of the walk. Git 2.56 records the path separately for each parent, making the result independent of traversal order and fixing cases such as subtree merges.

[[source](https://github.com/git/git/commit/304812ed33dec7ea7e68928feab38199d796ea25)]

  * Graphs with multiple roots can place an unrelated commit directly below a root commit in the same column, making the two appear connected. Git 2.56 indents these "visual roots" when necessary: 

`   * root of one visible history  
` `* unrelated commit`

This is enabled by default for git log --graph. Use --no-graph-indent for the
old rendering, or set log.graphIndent to choose a default.

[[source](https://github.com/git/git/commit/a34c00d96851009e94ec7618ad5c1464f920c80d)]

  * Several internal changes remove scaling cliffs from otherwise ordinary operations. Reftable writes now avoid redundant reloads after taking the lock, making filesystem-stat calls constant rather than linear in the number of refs. Loading known-new packfiles no longer scans the existing list before every insertion, eliminating an O(N²) regression that made a prompt-related command take 4.5 seconds in a repository with 37,815 packs.

Other changes removed quadratic scans from tombstone-heavy reftables and path-
limited working-tree diffs, while making untracked-file collection robustly
O(n log n) instead of relying on already-sorted input. The reftable tombstone
performance tests fell from about 13 seconds to 0.2 seconds. On a Chromium
checkout with roughly 500,000 index entries, one affected `git diff` improved
from about eight minutes to 0.07 seconds.

[[source](https://github.com/git/git/compare/3cb9185f65410273787f74333cc027d2ea5daada...976644c3800220166f65e5e0fe1f7499a3923a6a),
[source](https://github.com/git/git/commit/e4621a0169bdc2e7177f0609745957abe999dfbf),
[source](https://github.com/git/git/commit/7b2648f7454e4d2bfbb78e303ec23d9997e4c985),
[source](https://github.com/git/git/commit/146a94632139fc470af1fc118b5ff3dda2d15b40),
[source](https://github.com/git/git/commit/716766765c945c9ca62f24f6debc3f255ff3b6a6)]

## …the rest of the iceberg

That’s just a sample of changes from the latest release. For more, check out
the [release notes for
2.56](https://github.com/git/git/blob/v2.56.0/Documentation/RelNotes/2.56.0.adoc),
or [any previous
version](https://github.com/git/git/tree/v2.56.0/Documentation/RelNotes) in
[the Git repository](https://github.com/git/git).

##  Written by

![Elijah Newren](https://avatars.githubusercontent.com/u/5455730?v=4&s=200)

Elijah Newren is a Staff Software Engineer at GitHub. He is the designer and
implementer of merge-ort, Git's default merge strategy since 2.34, author of
git-filter-repo—the history rewriting tool the Git project officially
recommends—and a driving force behind sparse-checkout.

##  Explore more from GitHub

![Docs](https://github.blog/wp-content/uploads/2024/07/Icon-Circle.svg)

###  Docs

Everything you need to master GitHub, all in one place.

[ Go to Docs  ](https://docs.github.com/)

![GitHub](https://github.blog/wp-content/uploads/2024/07/recirculation-github-
icon.svg)

###  GitHub

Build what’s next on GitHub, the place for anyone from anywhere to build
anything.

[ Start building  ](https://github.com/)

![Customer stories](https://github.blog/wp-
content/uploads/2024/07/Icon_da43dc.svg)

###  Customer stories

Meet the companies and engineering teams that build with GitHub.

[ Learn more  ](https://github.com/customer-stories)

![GitHub Universe 2026](https://github.blog/wp-
content/uploads/2025/06/Universe26-Icon.svg)

###  GitHub Universe 2026

Join us October 28-29 in San Francisco or online for GitHub Universe, our
flagship developer event uniting people, agents, and the world’s code.

[ Register now
](https://githubuniverse.com/?utm_source=Blog&utm_medium=GitHub&utm_campaign=module_uni_26)