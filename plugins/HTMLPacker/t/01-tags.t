use strict;
use warnings;
use lib 't/lib', 'lib', 'extlib';

use Test::More;
use Test::Base;

use MT;
use MT::Test;
use MT::Template::Context;
use MT::Builder;

sub build {
  my $tmpl = shift;
  my $ctx = MT::Template::Context->new;
  my $builder = MT::Builder->new;
  my $tokens = $builder->compile($ctx, $tmpl) or die $builder->errstr;
  $builder->build($ctx, $tokens);
}

filters {
  input => [qw(build -trim)],
  expected => [qw(-trim)],
};

run_is input => 'expected';

done_testing;

__END__

=== minifyhtml block
--- input
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
--- expected
<ul><li> <a href="#foo">foo</a> </li><li> <a href="#bar">bar</a> </li><li> <a href="#baz">baz</a> </li></ul>
=== minify modifier
--- input
<mt:SetVarBlock name="ul">
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
<$mt:Var name="ul" minifyhtml="1"$>
--- expected

<ul><li> <a href="#foo">foo</a> </li><li> <a href="#bar">bar</a> </li><li> <a href="#baz">baz</a> </li></ul>
