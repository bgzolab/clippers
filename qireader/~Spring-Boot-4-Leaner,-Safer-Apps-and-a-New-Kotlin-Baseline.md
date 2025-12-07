---
comments: true
created: '2025-11-21T06:42:08'
draft: true
modified: '2025-11-21T06:42:08'
source: https://blog.jetbrains.com/idea/2025/11/spring-boot-4/
title: 'Spring Boot 4: Leaner, Safer Apps and a New Kotlin Baseline'
type: archive-web
---

[News](https://blog.jetbrains.com/idea/category/news/)

## Spring Boot 4: Leaner, Safer Apps and a New Kotlin Baseline

Spring Boot 4.0 has officially landed. At JetBrains, we’ve been tracking the
updates since the first milestones to ensure that IntelliJ IDEA delivers a
smooth and reliable development experience.

While many of the core capabilities come directly from Spring Framework 7,
Spring Boot remains the adoption enabler that brings everything together:
sensible defaults, consistent configuration, unified starters, and the
familiar lightning-fast productivity when creating applications.

As the most popular framework in the Java world, Spring Boot also helps
developers move from older JDK versions to newer ones that offer better
performance, more efficient garbage collectors, and modern language features.

This major Spring Boot release introduces cleaner modularization to reduce
memory usage, improved observability with Micrometer, JSpecify as the standard
null-safety library, and many other small improvements that streamline daily
development.

For JetBrains, the biggest news in Spring Boot 4 is that Kotlin 2.2 is now the
official baseline version for the framework. This milestone is the result of a
[long-standing
collaboration](https://blog.jetbrains.com/kotlin/2025/05/strategic-
partnership-with-spring/) between the JetBrains Kotlin team and the Spring
Framework team.

Let’s take a closer look at Spring Boot 4’s new features through the lens of
Kotlin 2.2.

## Nullability

The Kotlin compiler and IntelliJ IDEA now support JSpecify annotations
natively. You will receive a compiler warning if you use JSpecify-annotated
Java code incorrectly. In addition, IntelliJ IDEA will warn you if you try to
assign a Java variable annotated with `@Nullable` to a non-nullable variable
in Kotlin, and vice versa.

For example, for the Java interface:

    
    
    @NullMarked
    
    public interface QuoteProvider {
    
        Quote findQuote(String text);
    
    }

A Kotlin implementation must return a non-nullable Quote object from the
overridden `findQuote()` method:

![](https://blog.jetbrains.com/wp-content/uploads/2025/11/image1-2.png)

You’ll see the following error message:

![](https://blog.jetbrains.com/wp-content/uploads/2025/11/image-35.png)

IntelliJ IDEA detects the issue and suggests changing the return type to non-
nullable. JSpecify is now the default library for nullability checks across
all Spring projects. This means that when you create a Spring Boot 4 project
in Kotlin, you can be sure that the framework types that you use are null-
aware.

## API versioning

API versioning in Kotlin works much the same way as in
[Java](https://blog.jetbrains.com/idea/2025/11/intellij-
idea-2025-3-spring-7/#rest-api-versioning). Thanks to Spring’s well-designed
API versioning mechanism, adding a version takes only a few lines of
configuration and a single annotation attribute. In Kotlin, the versioned API
looks just as straightforward:

    
    
    @RestController
    
    @RequestMapping("/api", produces = [MediaType.APPLICATION_JSON_VALUE])
    
    class QuoteController(private val klient: QuoteKlient) {
    
        @GetMapping("quote", version = "1.0")
    
        fun fetchRandomQuote(): ResponseEntity<Quote> = 
    ResponseEntity.ok(klient.fetchRandomQuote())
    
        @GetMapping("quote", version = "2.0")
    
        fun fetchRandomQuotes(): ResponseEntity<List<Quote>> = 
    ResponseEntity.ok(klient.fetchRandomQuotes())
    
    }

There’s nothing fancy here, just the usual Kotlin conciseness, with IntelliJ
IDEA inspections helping you configure and validate version formats.

### Bean registration

Bean registration is one of the areas where Kotlin truly shines. Thanks to its
expressiveness and extensibility, it provides a powerful DSL for registering
beans dynamically when the regular `@ConditionalOn…` annotation family is
[insufficient](https://blog.jetbrains.com/idea/2025/11/intellij-
idea-2025-3-spring-7/#dynamic-bean-registration).

For example, instead of the following Java code:

    
    
    public class QuoteProviderRegistrar implements BeanRegistrar {
        @Override
    
        public void register(BeanRegistry registry, Environment env) {
    
            registry.registerBean("quoteProviderDb", QuoteProviderDb.class);
    
            registry.registerBean("quoteProviderFallback",
    
                    QuoteProviderFallback.class,
    
                    spec -> {
    
                        spec.fallback();
    
                        spec.order(1);
    
                    }
    
            );
    
        }
    
    }

You can write a more elegant version without all the `.class` calls and lambda
boilerplate:

    
    
    class KuoteProviderRegistrar : BeanRegistrarDsl({
    
        registerBean<QuoteProviderDb>("quoteProviderDb")
    
        registerBean<QuoteProviderFallback>(
    
            name = "quoteProviderFallback",
    
            fallback = true,
    
            order = 1
    
        )
    
    })

Much cleaner, right?

### Conclusion

Spring Boot is the most popular framework for Java development – and for good
reason. With Spring Boot 4 establishing Kotlin 2.2 as the baseline and
offering first-class support, we expect to see even broader Kotlin adoption
among backend developers who want to use the latest language features.

You can try Spring Boot 4 in the [2025.3
Beta](https://www.jetbrains.com/idea/nextversion/) release or wait for the
stable version, which is expected in early December.

At JetBrains, we continue to work closely with the Spring Framework team to
ensure Kotlin remains well-integrated and fully supported in the Spring
ecosystem.

#### Subscribe to IntelliJ IDEA Blog updates

![image description](https://blog.jetbrains.com/wp-
content/themes/jetbrains/assets/img/img-form.svg)