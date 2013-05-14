# NAME

HTMLPacker - Another HTML code cleaner by a Perl module HTML::Packer

# SYNOPSIS

__Input:__
  <mt:MinifyHTML>
  <ul>
    <li>
      <a href="\#foo">foo</a>
    </li>
    <li>
      <a href="\#bar">bar</a>
    </li>
    <li>
      <a href="\#baz">baz</a>
    </li>
  </ul>
  </mt:MinifyHTML>

__Output:__
  <ul><li> <a href="\#foo">foo</a> </li><li> <a href="\#bar">bar</a> </li><li> <a href="\#baz">baz</a> </li></ul>

__Input:__
  <mt:SetVarBlock name="mylist">
  <ul>
    <li>
      <a href="\#foo">foo</a>
    </li>
    <li>
      <a href="\#bar">bar</a>
    </li>
    <li>
      <a href="\#baz">baz</a>
    </li>
  </ul>
  </mt:SetVarBlock>

    <$mt:Var name="mylist" minifyhtml="1"$>

__Output:__
  <ul><li> <a href="\#foo">foo</a> </li><li> <a href="\#bar">bar</a> </li><li> <a href="\#baz">baz</a> </li></ul>

# DESCRIPTION

As it is HTML::Packer;

See also [HTML::Packer](http://search.cpan.org/perldoc?HTML::Packer).

# SEEALSO

[HTML::Packer](http://search.cpan.org/perldoc?HTML::Packer)

# LICENSE

Copyright (C) HIGASHI Taiju.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

HIGASHI Taiju <higashi@taiju.info>
