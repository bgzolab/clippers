---
created: 2026-04-10T00:33:02
modified: 2026-04-10T00:33:02
description: "By Alexander Arobelidze People have been using random numbers for millennia, so the concept isn't new. From the lottery in ancient Babylon, to roulette tables in Monte Carlo, to dice games in Vegas, the goal is to leave the end result up to random ch..."
source: "https://www.freecodecamp.org/news/random-number-generator"
tags:
  - "archive-web"
---
# Random Number Generator: How Do Computers Generate Random Numbers?

People have been using **random** **numbers** for millennia, so the concept isn't new. From the lottery in ancient Babylon, to roulette tables in Monte Carlo, to dice games in Vegas, the goal is to leave the end result up to random chance.

But gambling aside, **randomness** has many uses in science, statistics, cryptography and more. Yet using dice, coins, or similar media as a random device has its limitations.

Because of the mechanical nature of these techniques, generating large quantities of random numbers requires great deal of time and work. Thanks to human ingenuity, we have more powerful tools and methods at our disposal.

## Methods for generating random numbers

### True Random Numbers

![Image](https://www.freecodecamp.org/news/content/images/2021/06/image-145-opt.png) \_Picture of analog-input digital-output processing device. Photo by [Harrison Broadbent](https://unsplash.com/@harrisonbroadbent?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit) \_

Let's consider two principal methods used to generate random numbers. The **first method** is based on a physical process, and harvests the source of randomness from some physical phenomenon that is **expected** **to be random**.

Such a phenomenon takes place outside of the computer. It is measured and adjusted for possible biases due to the measurement process. Examples include radioactive decay, the photoelectric effect, cosmic background radiation, atmospheric noise (which we will use in this article), and more.

Thus, random numbers generated based on such randomness are said to be " **true** " random numbers.

Technically, the hardware part consists of a device that converts energy from one form to another (for example, radiation to an electrical signal), an amplifier, and an analog-to-digital converter to turn the output into a digital number.

## What are Pseudorandom Numbers?

![Image](https://www.freecodecamp.org/news/content/images/2021/06/image-146-opt.png) \_Picture of computer code flowing through computer screen. Photo by [Markus Spiske](https://unsplash.com/@markusspiske?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit).\_

As an alternative to "true" random numbers, the **second method** of generating random numbers involves computational algorithms that can produce apparently random results.

Why apparently random? Because the end results obtained are in fact completely determined by an initial value also known as the **seed** value or **key**. Therefore, if you knew the key value and how the algorithm works, you could reproduce these seemingly random results.

Random number generators of this type are frequently called **Pseudorandom number** generators and, as a result, output Pseudorandom Numbers.

Even though this type of generator typically doesn't gather any data from sources of naturally occurring randomness, such gathering of keys can be made possible when needed.

Let's compare some aspects of true random number generators or **TRNG** s and pseudorandom number generators or **PRNG** s.

PRNGs are faster than TRNGs. Because of their deterministic nature, they are useful when you need to replay a sequence of random events. This helps a great deal in code testing, for example.

On the other hand, TRNGs are not periodic and work better in security sensitive roles such as encryption.

A **period** is the number of iterations a PRNG goes through before it starts repeating itself. Thus, all other things being equal, a PRNG with a longer period would take more computer resources to predict and crack.

## Example Algorithm for Pseudo-Random Number Generator

A computer executes code that is based on a set of rules to be followed. For PRNGs in general, those rules revolve around the following:

1. **Accept** some initial input number, that is a seed or key.
2. **Apply** that seed in a sequence of mathematical operations to generate the result. That result is the random number.
3. **Use** that resulting random number as the seed for the next iteration.
4. **Repeat** the process to emulate randomness.

Now let's look at an example.

### The Linear Congruential Generator

This generator produces a series of pseudorandom numbers. Given an initial seed **X <sub>0</sub>** and integer parameters **a** as the multiplier, **b** as the increment, and **m** as the modulus, the generator is defined by the linear relation: **X <sub>n</sub> ≡ (aX <sub>n-1</sub> + b)mod m**. Or using more programming friendly syntax: **X <sub>n</sub> = (a \* X <sub>n-1</sub> + b) % m**.

Each of these members have to satisfy the following conditions:

- **m > 0** (the modulus is positive),
- **0 < a < m** (the multiplier is positive but less than the modulus),
- **0** ≤ **b < m** (the increment is non negative but less than the modulus), and
- **0** ≤ **X <sub>0</sub> < m** (the seed is non negative but less than the modulus).

Let's create a JavaScript function that takes the initial values as arguments and returns an array of random numbers of a given length:

```
// x0=seed; a=multiplier; b=increment; m=modulus; n=desired array length; 
    const linearRandomGenerator = (x0, a, b, m, n) => {
        const results = []
        for (let i = 0; i < n; i++) {
            x0 = (a * x0 + b) % m
            results.push(x0)
        }
        return results
    }
```

The Linear Congruential Generator is one of the oldest and best-known PRNG algorithms.

As for random number generator algorithms that are executable by computers, they date back as early as the 1940s and 50s (the [Middle-square method](https://en.wikipedia.org/wiki/Middle-square_method) and [Lehmer generator](https://en.wikipedia.org/wiki/Lehmer_random_number_generator), for example) and continue to be written today ([Xoroshiro128+](https://en.wikipedia.org/wiki/Xoroshiro128%2B), [Squares RNG](https://en.wikipedia.org/wiki/Counter-based_random_number_generator_\(CBRNG\)#Squares_RNG), and more).

## A Sample Random Number Generator

When I decided to write this article about embedding a random number generator within a web page, I had a choice to make.

I could've used JavaScript's **`Math.random()`** function as the base and generate output in pseudorandom numbers like I have in earlier articles (see [Multiplication Chart - Code Your Own Times Table](https://www.freecodecamp.org/news/multiplication-chart-code-your-own-times-table-using-javascript/)).

But this article itself is about generating random numbers. So I decided to learn how to gather "true" randomness based data and share my discovery with you.

So below is the "true" Random Number Generator. Set the parameters and hit Generate.

True Random Number Generator

Binary Decimal Hexadecimal

  

Generate

  

Result:

  

The code fetches data from one of the APIs, courtesy of [**Random.org**](https://www.random.org/). This online resource has a plethora of useful, customizable tools and comes with excellent documentation to go with it.

The randomness comes from atmospheric noise. I was able to use asynchronous functions. That is a huge benefit going forward. The core function looks like this:

```
// Generates a random number within user indicated interval
       const getRandom = async (min, max, base) => {
           const response = await     fetch("https://www.random.org/integers/?num=1&min="+min+"
    &max="+max+"&col=1&base="+base+"&format=plain&rnd=new")
              return response.text() 
       }
```

The parameters it takes allow a user to customize random number output. For example, **min** and **max** allow you to set lower and upper limits on generated output. And **base** determines if the output is printed as binary, decimal or hexadecimal.

Again, I chose this configuration but there are many more available at the [source](https://www.random.org/).

When you click the Generate button, the `handleGenerate()` function is called. It in turn invokes the `getRandom()` asynchronous function, manages error handling, and outputs results:

```
// Output handling
    const handleGenerate = () => {
        handleActive(generateButton)
        const base = binary.checked ? 2 : decimal.checked ? 10 : 16
        if (!minimum.value || !maximum.value) {
            prompter.style.color = 'red' 
            prompter.textContent = "Enter Min & Max values"
        } else {
            getRandom(minimum.value, maximum.value, base).then((data) => {
                resultValue.textContent = data
                prompter.textContent = ""    
            }).catch((error) => {
                resultValue.textContent = 'ERROR'
                prompter.textContent = 'Connection error. Unable to                         generate';    
            })
                handleRestart()
        }

   }
```

The rest of the code deals with HTML structure, appearance, and styling.

The code is ready to be embedded and used within this web page. I separated it into component parts and supplied it with detailed comments. It can easily be modified. You can also modify the functionality and styles as your needs require.

This is the link to the GitHub repo of the complete code: [https://github.com/sandroarobeli/random-generator](https://github.com/sandroarobeli/random-generator)