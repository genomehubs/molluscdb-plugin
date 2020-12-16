=head1 LICENSE

Copyright [1999-2015] Wellcome Trust Sanger Institute and the EMBL-European Bioinformatics Institute
Copyright [2016-2018] EMBL-European Bioinformatics Institute

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut

=head1 MODIFICATIONS

Copyright [2018] University of Edinburgh

All modifications licensed under the Apache License, Version 2.0, as above.

=cut

package EnsEMBL::Web::Document::Element::ToolLinks;

### Generates links in masthead

use strict;
use warnings;

use parent qw(EnsEMBL::Web::Document::Element);

sub links {
  my $self  = shift;
  my $hub   = $self->hub;
  my $sd    = $self->species_defs;
  my @links;

  my $browser_url = $self->hub->species_defs->BROWSER_URL;
  my $blast_url = $self->hub->species_defs->BLAST_URL;
  my $download_url = $self->hub->species_defs->DOWNLOAD_URL;
  my $help_url = $self->hub->species_defs->HELP_URL;
  push @links,   '<a href="'.$browser_url.'" title="Browser"><div class="lb-menu-category">Browser</div></a>';
  push @links,   '<a href="'.$blast_url.'" title="Blast"><div class="lb-menu-category">Blast</div></a>';
  push @links,   '<a href="'.$download_url.'" title="Download"><div class="lb-menu-category">Download</div></a>';
  push @links,   '<a href="'.$help_url.'" title="Help"><div class="lb-menu-category">Help</div></a>';

  return \@links;
}

sub content {
  my $self    = shift;
  my $hub     = $self->hub;
  my $links   = $self->links;
#  my $menu    = '';

  my $tools = join '', @$links;
  $tools = '<div class="lb-tools-holder">'.$tools.'</div>';
  return qq{
    $tools
  };
#  while (my (undef, $link) =  splice @$links, 0, 2) {
#    $menu .= sprintf '<li%s>%s</li>', @$links ? '' : ' class="last"', $link;
#  }
#
#  return qq(<ul class="tools">$menu</ul><div class="more"><a href="#">More <span class="arrow">&#9660;</span></a></div>);
}

1;
