# ⚖️ `libra`

<img
  src="https://raw.githubusercontent.com/ostera/libra/master/assets/john-mccarthy.png"
  align="right"
  height="100"
/>

> A Lisp Parser in Idris

Libra is a training exercise. It's not intended to be a production Lisp runtime.

### Goals

Through it, my aim is to learn more about dependent-types, compilers, and
languages in general.

I'd like it to be able to:

- [ ] Parse Lisp 1.5 syntax
- [ ] Perform useful syntax checking
- [ ] Evaluate a Lisp program
- [ ] Expose itself as a CLI tool

If I achieve those goals, I'd like it to (in no particular order):

- [ ] Perform type-checking a-la simply-typed Lambda Calculus
- [ ] Perform type-checking with dependent-types 
- [ ] Compile the program to Javascript
- [ ] Compile the program with optimizations

And I'm aware that it will diverge from the reference material at some point on
these last items, and I'm okay with that.

### Reference

As a language reference I'm using a copy of the [Lisp 1.5 Programmer's
Manual](http://www.softwarepreservation.org/projects/LISP/book/LISP%201.5%20Programmers%20Manual.pdf).
