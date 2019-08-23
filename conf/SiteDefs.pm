package EG::mdb::SiteDefs;

use strict;


sub update_conf {
  push @$SiteDefs::ENSEMBL_API_LIBS, $SiteDefs::ENSEMBL_SERVERROOT . '/molluscdb-plugin/modules';

  $SiteDefs::SITE_LOGO = 'molluscdb.png';
  $SiteDefs::SITE_LOGO_WIDTH = 150;
  $SiteDefs::SITE_LOGO_HEIGHT = 50;
  $SiteDefs::SITE_LOGO_ALT = 'MolluscDB Ensembl';
  $SiteDefs::SITE_NAME = 'MolluscDB Ensembl';

  $SiteDefs::ISSUE_TRACKER_URL = 'https://github.com/genomehubs/genomehubs/issues?status=new&status=open';
  $SiteDefs::ISSUE_TRACKER_TITLE = 'report an issue';

  $SiteDefs::ENSEMBL_SERVERADMIN = 'molluscdb&#064;genomehubs.org';


  $SiteDefs::ASSEMBLY_GROUP_A = [
          'Bathymodiolus_platifrons_bpl_v1_0',
          'Biomphalaria_glabrata_bb02_bglab1',
          'Crassostrea_gigas',
          'Lottia_gigantea',
          'Lymnaea_stagnalis_gls_v1_0_augustus',
          'Lymnaea_stagnalis_gls_v1_0_maker',
          'Modiolus_philippinarum_mph_v1_0',
          'Octopus_bimaculoides'
  ];
  $SiteDefs::ASSEMBLY_GROUP_A_TITLE = 'Genome assemblies';
  $SiteDefs::ASSEMBLY_GROUP_A_TEMPLATE = '_fav_template';
  $SiteDefs::ASSEMBLY_GROUP_B = [
          'Acanthochitona_crinita_mdb_srp095119_v1_0',
          'Cristaria_plicata_mdb_srp062467_v1_0',
          'Gadila_tolmiei_mdb_srp007793_v1_0',
          'Gymnomenia_pellucida_mdb_srp095119_v1_0',
          'Laevipilina_hyalina_mdb_srp044023_v1_0',
          'Laternula_elliptica_bas_srp115712_v1_0',
          'Mya_arenaria_mdb_srp045796_v1_0',
          'Mya_truncata_bas_srp115712_v1_0',
          'Mytilus_edulis_mdb_srp067223_v1_0',
          'Mytilus_galloprovincialis_mdb_srp063654_v1_0',
          'Octopoteuthis_deletron_mbari_srp096102_v1_0',
          'Pecten_maximus_mdb_srp067223_v1_0',
          'Scutopus_ventrolineatus_mdb_srp095119_v1_0',
          'Vampyroteuthis_infernalis_mbari_srp096102_v1_0',
          'Wirenia_argentea_mdb_srp095119_v1_0'
  ];
  $SiteDefs::ASSEMBLY_GROUP_B_TITLE = 'Transcriptome assemblies';
  $SiteDefs::ASSEMBLY_GROUP_B_TEMPLATE = '_list_template';
#  $SiteDefs::ASSEMBLY_GROUP_C = [
#  ];
#  $SiteDefs::ASSEMBLY_GROUP_C_TITLE = 'Other Hemiptera';
#  $SiteDefs::ASSEMBLY_GROUP_C_TEMPLATE = '_fav_template';
}


1;
