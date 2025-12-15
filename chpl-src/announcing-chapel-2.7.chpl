// Announcing Chapel 2.7!
// authors: ["David Longnecker", "Jade Abraham", "Lydia Duncan", "Daniel Fedorin", "Ben Harshbarger", "Brad Chamberlain"]
// summary: "Highlights from the December 2025 release of Chapel 2.7"
// tags: ["Release Announcements", "Interoperability", "Debugging", "Tools", "Dyno"]
// date: 2025-12-10
/*

  The Chapel community is pleased to announce the release of Chapel
  2.7!  As usual, you can [download and
  install](https://chapel-lang.org/download/) this new version in a
  {{<sidenote "right" "variety of formats">}}Note that some formats
  may not be immediately available on the day of the
  release...{{</sidenote>}}, including Spack, Docker, Homebrew,
  various Linux package managers, and good-old source tarballs.

  In this article, we'll introduce some of the highlights of Chapel
  2.7, including:

  * ... other stuff ...

  * Improvements to the capabilities of the [Dyno compiler
    front-end](#improvements-to-the-dyno-compiler-front-end)


  In addition to the above features, each of which is covered in more
  detail below, other highlights of Chapel 2.7 include:

  * ... other stuff ...

  ### Improvements to the Dyno Compiler Front-End

  As you may have seen in [previous]({{< relref
  "announcing-chapel-2.6#improvements-to-the-dyno-compiler-front-end"
  >}}) [release]({{< relref
  "announcing-chapel-2.5#improvements-to-the-dyno-compiler-front-end" >}})
  [announcements]({{< relref
  "announcing-chapel-2.4#dyno-support-for-chapel-features" >}}), _Dyno_ is
  the name of our effort to modernize and improve the Chapel compiler.
  Dyno improves error messages, allows incremental type resolution,
  and enables the [development of language tooling]({{< relref
  "chapel-py" >}}).  Among the major wins for this ongoing effort is
  the [Chapel Language Server
  (CLS)](https://chapel-lang.org/docs/2.7/tools/chpl-language-server/chpl-language-server.html),
  which was previously featured in a [blog post about editor
  integration]({{< relref "chapel-lsp" >}}), not to mention Chapel's
  linter, VSCode support, and `chpldoc`.

  Our team has been hard at work implementing many features of
  Chapel's type system in Dyno, which---among other things---will
  enable tools like CLS to provide more accurate and helpful
  information to users.  In the 2.7 release, we have continued to
  improve Dyno's support for Chapel's language features, and we've
  also expanded the compiler's ability to leverage the Dyno front-end
  to generate executable code.

  #### More Language Features

  Dyno's resolver for types and calls has seen the usual steady stream
  of improvements. In this release, some notable changes include:

  * improvements for array formals and array formal type queries
  * improvements to [split-initialization](https://chapel-lang.org/docs/language/spec/variables.html#split-initialization) of variables
  * support for more compiler-generated casts

  The following screenshots show an editing session in which Dyno-inferred
  type information is rendered in-line when editing the corresponding code
  examples. The first example is that of array formals:

  {{< file_download_min fname="array-formals.chpl" lang="chapel" >}}
  {{< figure class="fullwide" src="./dyno-array-formals.png" alt="Dyno displaying inferred type information for array formals" >}}

  In the above example, we use the same generic function `foo` to accept
  both a regular (default-rectangualar) array and a block-distributed array.
  Both of these arrays are accepted as normal, and queries in the formal type
  extract the domain and element type information. The `infoA` and `infoB`
  variables therefore contain accurate descriptions of the arrays passed to
  `foo`.

  The second example demonstrates new support for generated casts.

  {{< file_download_min fname="casts.chpl" lang="chapel" >}}
  {{< figure class="fullwide" src="./dyno-casts.png" alt="Dyno displaying inferred type information for generated casts" >}}

  A cast from an integer-string tuple is performed to create a real-integer
  tuple, casting the integer to a real and the string to an integer. Also, a
  cast from an enum constant of type `color` is converted to a `param` value of
  type `bytes`. Finally, notice that the language server is also showing the
  inferred numeric values corresponding to the enum constants (`2` for `green`
  and `3` for `blue`).

  The final example demonstrates Dyno's improved support for
  split-initialization of variables.

  {{< file_download_min fname="splitinit.chpl" lang="chapel" >}}
  {{< figure class="fullwide" src="./dyno-splitinit.png" alt="Dyno displaying inferred type information for split-initialized variables" >}}

  Here, the `const` variables `c` and `C` are initialized by calling a
  function with `out` formals. This is a new capability in the 2.7 version
  of Dyno, as is one of the formals being an array, and the initialization
  occurring at module scope --- lots of improvements in one small example!
  Additionally, Dyno now properly rejects the attempt to split-initialize
  an integer variable with a real value, but allows the reverse, where a
  coercion can take place.

  #### Generating Executable Code

  This release also saw improvements to our support for using
  Dyno to generate executable code, which is a major step toward
  Dyno's goal of replacing the front-end of the production
  compiler. This is an ongoing process that involves taking the
  information that Dyno has computed about the program and generating
  AST for the production compiler, essentially skipping over its
  historical type resolution and analysis phases. This capability is
  enabled using the ``--dyno`` command-line flag.

  Initial support is limited to a subset of Chapel's language
  features, but is growing all the time.  Here is an example program
  and helper module that Dyno can now compile, demonstrating uses of
  language features like param for-loops and grouped variable initialization.
  This program also demonstrates Dyno's abililty to compile standard module
  code, like that found in Chapel's ``IO`` module. This represents a
  significant step forward in Dyno's ability to compile real-world Chapel code:

  {{< file_download fname="converter.chpl" lang="chapel" >}}

  {{< file_download_min fname="Print.chpl" lang="chapel" >}}

  The program above can be {{< sidenote "right" "compiled" >}}
  The <code>--no-checks</code> flag is used here to disable runtime checks that
  utilize language features not yet supported by Dyno's code generation.
  {{< /sidenote >}}
  with ``--dyno --no-checks`` to produce an executable that prints the
  following output:

  {{< file_download fname="converter.good" lang="text" >}}

  Looking ahead, we plan to continue expanding the set of supported language
  features and standard modules that Dyno can compile. In the near term we
  will be directing our focus to fully resolving 'writeln' itself, and
  tackling core language features like iterators and error handling.

  Stay tuned as we continue to add support for more features to Dyno!


  ### For More Information

  If you have questions about Chapel 2.7 or any of its new features,
  please reach out on Chapel's [Discord
  channel](https://discord.gg/xu2xg45yqH), [Discourse
  group](https://chapel.discourse.group/), or one of our other
  [community forums](https://chapel-lang.org/community/).  In
  addition, we're always interested in hearing about how we can make
  the Chapel language, libraries, implementation, and tools more
  useful to you.

*/
