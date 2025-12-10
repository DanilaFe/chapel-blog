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
  "announcing-chapel-2.5#dyno-support-for-chapel-features" >}})
  [announcements]({{< relref
  "announcing-chapel-2.4#dyno-compiler-improvements" >}}), _Dyno_ is
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


  _TODO: Daniel's section_

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
  The '--no-checks' flag is used here to disable runtime checks that
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

  If you have questions about Chapel 2.6 or any of its new features,
  please reach out on Chapel's [Discord
  channel](https://discord.gg/xu2xg45yqH), [Discourse
  group](https://chapel.discourse.group/), or one of our other
  [community forums](https://chapel-lang.org/community/).  In
  addition, we're always interested in hearing about how we can make
  the Chapel language, libraries, implementation, and tools more
  useful to you.

  {{< changetable >}}
  | Date         | Change                                                      |
  |:-------------|:----------------------------------------------------------------------------------|
  | Sept 26, 2025  | Fixed dynamic library calls to use `c_int` rather than `int`  |

*/
