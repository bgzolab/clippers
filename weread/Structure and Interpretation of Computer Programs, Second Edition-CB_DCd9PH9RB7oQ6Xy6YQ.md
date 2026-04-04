---
doc_type: weread-highlights-reviews
bookId: CB_DCd9PH9RB7oQ6Xy6YQ
reviewCount: 0
noteCount: 19
author:
  - Harold Abelson, Gerald Jay Sussman, Julie Sussman
  - MIT Press
cover: https://res.weread.qq.com/wrepub/CB_GNH7ut7tJGPO6UA6UO_parsecover
progress: 0%
readingTime: 0小时55分钟
readingDate: 1970-01-01
title: Structure and Interpretation of Computer Programs, Second Edition
published:
isbn:
tags:
  - weread/
type: weread-notes
weread: https://weread.qq.com/web/reader/1aa42352a43425f444364395048395242376f513658793659511c4

---


## Unofficial Texinfo Format

## Dedication

## Foreword

## Preface to the Second Edition

## Preface to the First Edition

## Acknowledgments

## 1 Building Abstractions with Procedures

> [!NOTE] 
> The third is separating them from allother ideas that accompany them in their real existence: this is called abstraction, andthus all its general ideas are made.
> 
> 2022-04-10 15:55:58 ^CB-DCd9PH9RB7oQ6Xy6YQ-7-2366-2529

### 1.1 The Elements of Programming

> [!NOTE] 
> Every powerful language has three mechanisms for accomplishing this:primitive expressions, which represent the simplest entities the language is concerned with,means of combination, by which compound elements are built from simpler ones, andmeans of abstraction, by which compound elements can be named and manipulated as units.
> 
> 2022-04-10 15:56:25 ^CB-DCd9PH9RB7oQ6Xy6YQ-8-2257-2646

#### 1.1.1 Expressions

#### 1.1.2 Naming and the Environment

#### 1.1.3 Evaluating Combinations

> [!NOTE] 
> we can imagine that the values of the operandspercolate upward
> 
> 2022-04-10 16:53:49 ^CB-DCd9PH9RB7oQ6Xy6YQ-11-3922-3985

> [!NOTE] 
> percolate values upward” form of theevaluation rule is an example of a general kind of process known as tree accumulation
> 
> 2022-04-10 16:55:04 ^CB-DCd9PH9RB7oQ6Xy6YQ-11-4202-4365

> [!NOTE] 
> special forms.
> 
> 2022-04-10 17:03:25 ^CB-DCd9PH9RB7oQ6Xy6YQ-11-6688-6745

> [!NOTE] 
> The various kinds of expressions (each with itsassociated evaluation rule) constitute the syntax of the programming language
> 
> 2022-04-10 17:03:59 ^CB-DCd9PH9RB7oQ6Xy6YQ-11-6913-7038

#### 1.1.4 Compound Procedures

> [!NOTE] 
> We can understand this in the following way
> 
> 2022-04-10 17:06:11 ^CB-DCd9PH9RB7oQ6Xy6YQ-12-2547-2590

> [!NOTE] 
> one could not tell by looking at the definition of sum-of-squares given above whether squarewas built into the interpreter, like + and *, or defined as a compound procedure
> 
> 2022-04-10 17:09:13 ^CB-DCd9PH9RB7oQ6Xy6YQ-12-8266-8491

#### 1.1.5 The Substitution Model for Procedure Application

> [!NOTE] 
> Substitution Model for Procedure Application
> 
> 2022-04-10 17:11:10 ^CB-DCd9PH9RB7oQ6Xy6YQ-13-1394-1438

> [!NOTE] 
> Thus the problem reduces to the evaluation of a combination with two operands and anoperator sum-of-squares
> 
> 2022-04-10 17:11:26 ^CB-DCd9PH9RB7oQ6Xy6YQ-13-3728-3842

> [!NOTE] 
> wemust apply the sum-of-squares procedure to 6 and 10. These values are substituted for theformal parameters x and y in the body of sum-of-squares, reducing the expression to
> 
> 2022-04-10 17:12:21 ^CB-DCd9PH9RB7oQ6Xy6YQ-13-4109-4338

> [!NOTE] 
> versus
> 
> 2022-04-10 17:14:28 ^CB-DCd9PH9RB7oQ6Xy6YQ-13-7839-7845

#### 1.1.6 Conditional Expressions and Predicates

> [!NOTE] 
> case analysis
> 
> 2022-04-10 17:16:54 ^CB-DCd9PH9RB7oQ6Xy6YQ-14-3276-3289

> [!NOTE] 
> clauses
> 
> 2022-04-10 17:38:48 ^CB-DCd9PH9RB7oQ6Xy6YQ-14-6029-6036

> [!NOTE] 
> predicate
> 
> 2022-04-10 17:39:06 ^CB-DCd9PH9RB7oQ6Xy6YQ-14-6115-6124

> [!NOTE] 
> The word predicate is used for procedures that return true or false, as well as for expressionsthat evaluate to true or false. The absolute-value procedure abs makes use of the primitivepredicates >, <, and =.18 These take two numbers as arguments and test whether the firstnumber is, respectively, greater than, less than, or equal to the second number, returningtrue or false accordingly.
> 
> 2022-04-10 17:40:02 ^CB-DCd9PH9RB7oQ6Xy6YQ-14-8071-8631

#### 1.1.7 Example: Square Roots by Newton’s Method

#### 1.1.8 Procedures as Black-Box Abstractions

> [!NOTE] 
> For example, when we define the good-enough? procedure in terms of square, weare able to regard the square procedure as a “black box.” We are not at that momentconcerned with how the procedure computes its result, only with the fact that it computesthe square. The details of how the square is computed can be suppressed, to be consideredat a later time. Indeed, as far as the good-enough? procedure is concerned, square is not quitea procedure but rather an abstraction of a procedure, a so-called procedural abstraction. Atthis level of abstraction, any procedure that computes the square is equally good.
> 
> 2022-04-10 17:46:31 ^CB-DCd9PH9RB7oQ6Xy6YQ-16-3277-4019

> [!NOTE] 
> We would like tolocalize the subprocedures, hiding them inside sqrt so that sqrt could coexist with othersuccessive approximations, each having its own private good-enough? procedure.
> 
> 2022-04-10 17:52:40 ^CB-DCd9PH9RB7oQ6Xy6YQ-16-14540-14765

> [!NOTE] 
> internal definitions that are local to that procedure.
> 
> 2022-04-10 17:52:47 ^CB-DCd9PH9RB7oQ6Xy6YQ-16-14818-14872

### 1.2 Procedures and the Processes They Generate

#### 1.2.1 Linear Recursion and Iteration

#### 1.2.2 Tree Recursion

#### 1.2.3 Orders of Growth

#### 1.2.4 Exponentiation

#### 1.2.5 Greatest Common Divisors

#### 1.2.6 Example: Testing for Primality

### 1.3 Formulating Abstractions with Higher-Order Procedures

#### 1.3.1 Procedures as Arguments

#### 1.3.2 Constructing Procedures Using

#### 1.3.3 Procedures as General Methods

#### 1.3.4 Procedures as Returned Values

## 2 Building Abstractions with Data

### 2.1 Introduction to Data Abstraction

#### 2.1.1 Example: Arithmetic Operations for Rational Numbers

#### 2.1.2 Abstraction Barriers

#### 2.1.3 What Is Meant by Data?

#### 2.1.4 Extended Exercise: Interval Arithmetic

### 2.2 Hierarchical Data and the Closure Property

#### 2.2.1 Representing Sequences

#### 2.2.2 Hierarchical Structures

#### 2.2.3 Sequences as Conventional Interfaces

#### 2.2.4 Example: A Picture Language

### 2.3 Symbolic Data

#### 2.3.1 Quotation

#### 2.3.2 Example: Symbolic Differentiation

#### 2.3.3 Example: Representing Sets

#### 2.3.4 Example: Huffman Encoding Trees

### 2.4 Multiple Representations for Abstract Data

#### 2.4.1 Representations for Complex Numbers

#### 2.4.2 Tagged data

#### 2.4.3 Data-Directed Programming and Additivity

### 2.5 Systems with Generic Operations

#### 2.5.1 Generic Arithmetic Operations

#### 2.5.2 Combining Data of Different Types

#### 2.5.3 Example: Symbolic Algebra

## 3 Modularity, Objects, and State

### 3.1 Assignment and Local State

#### 3.1.1 Local State Variables

#### 3.1.2 The Benefits of Introducing Assignment

#### 3.1.3 The Costs of Introducing Assignment

### 3.2 The Environment Model of Evaluation

#### 3.2.1 The Rules for Evaluation

#### 3.2.2 Applying Simple Procedures

#### 3.2.3 Frames as the Repository of Local State

#### 3.2.4 Internal Definitions

### 3.3 Modeling with Mutable Data

#### 3.3.1 Mutable List Structure

#### 3.3.2 Representing Queues

#### 3.3.3 Representing Tables

#### 3.3.4 A Simulator for Digital Circuits

#### 3.3.5 Propagation of Constraints

### 3.4 Concurrency: Time Is of the Essence

#### 3.4.1 The Nature of Time in Concurrent Systems

#### 3.4.2 Mechanisms for Controlling Concurrency

### 3.5 Streams

#### 3.5.1 Streams Are Delayed Lists

#### 3.5.2 Infinite Streams

#### 3.5.3 Exploiting the Stream Paradigm

#### 3.5.4 Streams and Delayed Evaluation

#### 3.5.5 Modularity of Functional Programs and Modularity of Objects

## 4 Metalinguistic Abstraction

### 4.1 The Metacircular Evaluator

#### 4.1.1 The Core of the Evaluator

#### 4.1.2 Representing Expressions

#### 4.1.3 Evaluator Data Structures

#### 4.1.4 Running the Evaluator as a Program

#### 4.1.5 Data as Programs

#### 4.1.6 Internal Definitions

#### 4.1.7 Separating Syntactic Analysis from Execution

### 4.2 Variations on a Scheme — Lazy Evaluation

#### 4.2.1 Normal Order and Applicative Order

#### 4.2.2 An Interpreter with Lazy Evaluation

#### 4.2.3 Streams as Lazy Lists

### 4.3 Variations on a Scheme — Nondeterministic Computing

#### 4.3.1 Amb and Search

#### 4.3.2 Examples of Nondeterministic Programs

#### 4.3.3 Implementing the

### 4.4 Logic Programming

#### 4.4.1 Deductive Information Retrieval

#### 4.4.2 How the Query System Works

#### 4.4.3 Is Logic Programming Mathematical Logic?

#### 4.4.4 Implementing the Query System

















## 5 Computing with Register Machines

### 5.1 Designing Register Machines

#### 5.1.1 A Language for Describing Register Machines

#### 5.1.2 Abstraction in Machine Design

#### 5.1.3 Subroutines

#### 5.1.4 Using a Stack to Implement Recursion

#### 5.1.5 Instruction Summary

### 5.2 A Register-Machine Simulator

#### 5.2.1 The Machine Model

#### 5.2.2 The Assembler

#### 5.2.3 Generating Execution Procedures for Instructions

#### 5.2.4 Monitoring Machine Performance

### 5.3 Storage Allocation and Garbage Collection

#### 5.3.1 Memory as Vectors

#### 5.3.2 Maintaining the Illusion of Infinite Memory

### 5.4 The Explicit-Control Evaluator

#### 5.4.1 The Core of the Explicit-Control Evaluator

#### 5.4.2 Sequence Evaluation and Tail Recursion

#### 5.4.3 Conditionals, Assignments, and Definitions

#### 5.4.4 Running the Evaluator

### 5.5 Compilation

#### 5.5.1 Structure of the Compiler

#### 5.5.2 Compiling Expressions

#### 5.5.3 Compiling Combinations

#### 5.5.4 Combining Instruction Sequences

#### 5.5.5 An Example of Compiled Code

#### 5.5.6 Lexical Addressing

#### 5.5.7 Interfacing Compiled Code to the Evaluator

## References

## List of Exercises

## List of Figures

## Term Index

## Colophon
