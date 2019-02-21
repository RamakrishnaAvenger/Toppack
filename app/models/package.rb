class Package < ApplicationRecord
    def self.get_top_10_packages
        Package.group(:package_name).count.sort_by{|k,v| v}.reverse
    end
    def self.get_top_3_packages(query)
        @re="%"+query+"%"
        Package.select(:package_name).where('package_name LIKE ?',@re).limit(3)
    end
    def self.get_repo_names_from_package_db
        Package.select(:repo_name).distinct
    end

end
