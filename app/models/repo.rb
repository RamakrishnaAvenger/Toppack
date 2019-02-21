class Repo < ApplicationRecord
    def self.get_top_10_repos
        Repo.select(:repo_name,:repo_stars).order(repo_stars: :desc).limit(10)
    end
end
