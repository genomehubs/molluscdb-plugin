=head1 LICENSE
Copyright [2009-2014] EMBL-European Bioinformatics Institute
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
Copyright [2014-2019] University of Edinburgh
All modifications licensed under the Apache License, Version 2.0, as above.
=cut

package EnsEMBL::Web::Document::Element::Copyright;

### Copyright notice for footer (basic version with no logos)

use strict;

use base qw(EnsEMBL::Web::Document::Element);

sub new {
  return shift->SUPER::new({
    %{$_[0]},
    sitename => '?'
  });
}

sub sitename :lvalue { $_[0]{'sitename'}; }

sub content {
  my $self = shift;
  my @time = localtime;
  my $year = @time[5] + 1900;
  my $privacy_url  = $self->hub->species_defs->GDPR_POLICY_URL;

  my $privacy_link = $privacy_url ? qq((<a href="$privacy_url">Privacy policy</a>)) : '';

  ## BEGIN MOLLUSCDB MODIFICATIONS...

  my $site_name = $self->hub->species_defs->ENSEMBL_SITE_NAME_SHORT;
  my $site_version = $self->hub->species_defs->SITE_RELEASE_VERSION;
  my $site_date = $self->hub->species_defs->SITE_RELEASE_DATE;
  my $html = '<div class=lb-ackn-logos>';
  $html .= '<a href="http://www.ed.ac.uk/"><img title="University of Edinburgh" class="lb-footer-logo" src="/img/edinburgh_logo.png"></a>';
  $html .= '<a href="https://www.bas.ac.uk/project/cache-itn"><img title="CACHE" class="lb-footer-logo" src="/img/cache-icon.jpg"></a>';

  $html .= '</div>';

    return qq{
      <div class="column-two left">
        <p>
          MolluscDB release 2 &copy; $year <span class="print_hide"><a href="http://www.ed.ac.uk/" style="white-space:nowrap">Edinburgh University</a></span>.
          $privacy_link
          <br/>
          EnsEMBL &copy; $year <span class="print_hide"><a href="//www.ebi.ac.uk/" style="white-space:nowrap">EMBL-EBI</a></span>.
        </p>
        $html
      </div>
    };
  ## ...END MOLLUSCDB MODIFICATIONS

}

sub init {
  $_[0]->sitename = $_[0]->species_defs->ENSEMBL_SITETYPE;
}

1;
