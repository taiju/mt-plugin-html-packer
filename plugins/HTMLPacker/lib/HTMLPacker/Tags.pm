package HTMLPacker::Tags;
use strict;
use warnings;
use HTML::Packer;

sub _minifyhtml_block {
  my ($ctx, $arg, $cond) = @_;
  my $tokens = $ctx->stash('tokens');
  my $builder = $ctx->stash('builder');
  my $packer = HTML::Packer->init;
  my $out = $builder->build($ctx, $tokens, $cond);
  $packer->minify(\$out, { remove_newlines => 1 });
  $out;
}

sub _minifyhtml_modifier {
  my ($str, $arg, $ctx) = @_;
  my $packer = HTML::Packer->init;
  $packer->minify(\$str, { remove_newlines => 1 }) if $arg == 1;
  $str;
}


1;
__END__

=encoding utf-8

=head1 NAME

HTMLPacker - Another HTML code cleaner by a Perl module HTML::Packer

=head1 SYNOPSIS

B<Input:>
  <mt:MinifyHTML>
  <ul>
    <li>
      <a href="#foo">foo</a>
    </li>
    <li>
      <a href="#bar">bar</a>
    </li>
    <li>
      <a href="#baz">baz</a>
    </li>
  </ul>
  </mt:MinifyHTML>

B<Output:>
  <ul><li> <a href="#foo">foo</a> </li><li> <a href="#bar">bar</a> </li><li> <a href="#baz">baz</a> </li></ul>

B<Input:>
  <mt:SetVarBlock name="mylist">
  <ul>
    <li>
      <a href="#foo">foo</a>
    </li>
    <li>
      <a href="#bar">bar</a>
    </li>
    <li>
      <a href="#baz">baz</a>
    </li>
  </ul>
  </mt:SetVarBlock>

  <$mt:Var name="mylist" minifyhtml="1"$>

B<Output:>
  <ul><li> <a href="#foo">foo</a> </li><li> <a href="#bar">bar</a> </li><li> <a href="#baz">baz</a> </li></ul>

=head1 DESCRIPTION

As it is HTML::Packer;

See also L<HTML::Packer>.

=head1 SEEALSO

L<HTML::Packer>

=head1 LICENSE

Copyright (C) HIGASHI Taiju.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

HIGASHI Taiju E<lt>higashi@taiju.infoE<gt>

=cut
