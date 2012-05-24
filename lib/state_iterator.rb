require 'open-uri'
require 'organization_importer'

class StateIterator

  class << self

    def import_all
      files.map do |file|
        puts "Parsing #{file}.xls"
        import_from file
      end
    end

    private

    def files
      %w[ eo_ak eo_al eo_ar eo_az eo_caab eo_cace eo_cafh eo_cail eo_camp
      eo_caqs eo_catz eo_co eo_ct eo_dc eo_de eo_flac eo_fldm eo_flnz eo_gaai
      eo_gajz eo_hi eo_ia eo_id eo_ilac eo_ildm eo_ilnz eo_inai eo_injz eo_ks
      eo_ky eo_la eo_maak eo_malz eo_mdal eo_mdmz eo_me eo_miaj eo_mikz eo_mnam
      eo_mnnz eo_moaj eo_mokz eo_ms eo_mt eo_ncal eo_ncmz eo_nd eo_ne eo_nh
      eo_njal eo_njmz eo_nm eo_nv eo_nyac eo_nydj eo_nykp eo_nyqz eo_ohae
      eo_ohfn eo_ohoz eo_ok eo_or eo_paae eo_pafn eo_paoz eo_pr eo_ri eo_sc
      eo_sd eo_tn eo_txac eo_txdh eo_txip eo_txqz eo_ut eo_vaam eo_vanz eo_vt
      eo_waak eo_walz eo_wial eo_wimz eo_wv eo_wy eo_xx ]
    end

    def path_to(file)
      open "http://www.irs.gov/pub/irs-soi/#{file}.xls"
    end

    def import_from(file)
      OrganizationImporter.import(path_to(file))
      OrganizationImporter.all.map do |oi|
        oi.save_to_db
      end
      # Cheating...
      OrganizationImporter.instance_variable_set :@records, []
    end

  end

end
