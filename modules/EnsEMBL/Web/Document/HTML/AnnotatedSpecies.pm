=head1 LICENSE
Copyright [1999-2014] Wellcome Trust Sanger Institute and the EMBL-European Bioinformatics Institute
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
Copyright [2014-2015] University of Edinburgh
All modifications licensed under the Apache License, Version 2.0, as above.
=cut

package EnsEMBL::Web::Document::HTML::AnnotatedSpecies;

use strict;

use base qw(EnsEMBL::Web::Document::HTML);

sub render {
  my $self      = shift;
  my $fragment  = shift eq 'fragment';
  my $html = $self->render_species_list($fragment);

  #warn $html;

  return $html;
}

sub render_species_list {
  my ($self, $fragment) = @_;
  my $hub           = $self->hub;
  my $logins        = $hub->users_available;
  my $user          = $hub->user;
  my $species_info  = $hub->get_species_info;
  my $site_name = $self->hub->species_defs->ENSEMBL_SITE_NAME_SHORT;

  my (@ok_faves, %assemblies, %check_faves);

  foreach (@{$hub->get_favourite_species}) {
    next unless $species_info->{$_};
    push @ok_faves, $species_info->{$_}->{'scientific'} unless $check_faves{$species_info->{$_}->{'scientific'}}++;
    push @{$assemblies{$species_info->{$_}->{'scientific'}}}, $species_info->{$_};
  }
  my $html;
  if (@ok_faves){
    my $fav_html = $self->render_with_images(\@ok_faves,\%assemblies);
    $html = '<div class="static_favourite_species"><h3 class="lb-heading">Genome assemblies with gene models</h3><div class="species_list_container species-list">'.$fav_html.'</div></div>';
  }

  return $html;
}

sub render_with_images {
  my ($self, $species_list, $assemblies) = @_;
  my $hub           = $self->hub;
  my $species_defs  = $hub->species_defs;
  my $static_server = $species_defs->ENSEMBL_STATIC_SERVER;
  my $html;



  foreach (@$species_list) {
    my $links = '<br/><span class="lb-alternate-assemblies">';
    foreach my $asm (@{$assemblies->{$_}}){
      $links .= qq(<a class="lb-alternate-assemblies" href="$asm->{'key'}/Info/Index">$asm->{'assembly'}</a>
      );
    }
    $links .= '</span>';
    $html .= qq(
      <div class="lb-species-box">
        <a href="$assemblies->{$_}[0]->{'key'}/Info/Index">
          <div class="lb-sp-img"><img src="$static_server/i/species/48/$assemblies->{$_}[0]->{'key'}.png" alt="$assemblies->{$_}[0]->{'name'}" title="Browse $assemblies->{$_}[0]->{'name'}" height="48" width="48" /></div>
        </a>
        <a class="lb-primary-assembly" href="$assemblies->{$_}[0]->{'key'}/Info/Index">
          $assemblies->{$_}[0]->{'scientific'}
        </a>
        $links
      </div>
    );
  }

  return $html;
}

1;
