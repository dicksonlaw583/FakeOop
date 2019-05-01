# Fake OOP with GameMaker Studio 2 Macros

## Overview

This short experiment implements a hacky way to add OOP-like features to pre-OOP GameMaker Studio 2 using a single script. I hope to use this proof-of-concept as an example of a domain-specific language written using macros, and encourage early exploration into OOP patterns ahead of the GML 2020 update.

## Features

- One-script installation and no external dependencies
- Duck typing using strings as function names
- Automatic inheritance of methods from parents and support for overriding them
- Support for building arguments to a method call at runtime
- Support for mixins

## Installation

Create a script named `o` in your project, and copy-and-paste the contents of `scripts/o/o.gml` into it.

## Documentation and Known Issues

See [official wiki](https://github.com/dicksonlaw583/FakeOop/wiki).

## DISCLAIMER: This is an experiment only!

While efforts have been made to validate the functionality of the script, please keep in mind that this is only a temporary experimental project. You may freely use the script in any GameMaker Studio 2 project, but it is provided only on an as-is basis with no implied warranty. In addition, I will not provide support for it past YoYo Games' planned implementation of actual OOP in post-2020 GML.