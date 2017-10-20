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
Copyright [2014-2017] University of Edinburgh
All modifications licensed under the Apache License, Version 2.0, as above.
=cut

package EnsEMBL::Web::Document::Element::FooterLinks;

### Replacement footer links for www.ensembl.org

use strict;

sub content {

## BEGIN MDB MODIFICATIONS...
  return qq(
    <div class="twocol-right right">
      <a href="mailto:molluscdb\@gmail.com" title="molluscdb\@gmail.com"><font size="+2">contact&#64;molluscdb.org</a> |
      <a href="http://genomehubs.org/" title="genomehubs.org"><font size="+2">genomehubs.org</a> |
      <a href="http://www.ensembl.org/" title="ensembl.org"><img style="height:auto;margin-top:-5px;background:none;border:none;" src="/i/empowered.png"></img></a>
    </div>)
  ;
## ...END MDB MODIFICATIONS
}

1;
