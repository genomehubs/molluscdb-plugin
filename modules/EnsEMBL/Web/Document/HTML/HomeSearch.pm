 # Custom description on about section
 my $blast_link = 'Search for genes and regions of interest using <a href="'.$species_defs->BLAST_URL.'">BLAST</a>';
 if (keys %$sample_data) {
    my $collection_param = $collection ? ";collection=$collection" : '';
    $examples = join ' or ', map { $sample_data->{$_}
      ? qq(<a class="nowrap" href="$search_url?q=$sample_data->{$_}&sp=$lc_sp">$sample_data->{$_}</a>)
      : ()
    } qw(GENE_TEXT LOCATION_TEXT SEARCH_TEXT);
    $examples = qq(<p class="search-example">$blast_link or use the box in the the top right to search for genes, scaffolds and annotations.</p><p class="search-example">Example search terms: $examples</p>) if $examples;
  }
  $examples = qq(<p class="search-example">$blast_link</p>) unless $examples;
  return sprintf '<div>%s</div>',$examples;
  # form field
  my $f_params = {'notes' => $examples};
  $f_params->{'label'} = 'Search' if $is_home_page;
  my $field = $form->add_field($f_params);
  	return;
