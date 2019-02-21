class RepoController < ApplicationController
    def index
    end
    skip_before_action :verify_authenticity_token
    def save_data
        @repo_data=Repo.create(repo_params)
        @package=package_params
        # puts "package data"
        # puts @package
        @dependency_data=@package["dependencies"]+@package['devDependencies']
        for i in @dependency_data
            @package_data=Package.create({"repo_name"=>repo_params["repo_name"],"package_name"=>i})
        end
        @database=Repo.all
        @package_database=Package.all
        # puts @database
        # puts @package_database



    end
    def top_packages
        @top_10_packages=Package.get_top_10_packages
        @top_10_packages_data=@top_10_packages[0..9]
        puts "hello world......"
        @title_data=[]
        puts title_params
        if title_params=={}
            query=''
            @title_data=Package.get_top_3_packages(query)    
        else
            @title_data=Package.get_top_3_packages(title_params["query"])
        end
        puts @title_data
        @title_data.each do |title|
            puts title[:package_name]
        end
        
    end
    def barchart
        @bar_data=Repo.get_top_10_repos
        puts @bar_data
    end
    def top_repos
        @top_10_packages=Package.get_top_10_packages
        @top_10_packages_data=@top_10_packages[0..9]
        print @top_10_packages_data
        @top_3_repos={}
        @top_10_packages_data.each do |package|
            @packagename=package[0]
            @repos_array=Array.new
            @top_repos_from_db=Repo.select(:repo_name).joins("INNER JOIN packages ON packages.package_name='"+@packagename+"' AND packages.repo_name = repos.repo_name").order(repo_stars: :desc).distinct.limit(3)
            @top_repos_from_db.each do |repo|
                puts repo[:repo_name]
            end
            @top_repos_from_db.each do |repo|
                @repos_array.push(repo[:repo_name])
            end
            @top_3_repos[@packagename]=@repos_array
        end
        puts @top_3_repos

    end
    private
        def repo_params
            params.permit(:repo_name,:repo_stars,:repo_forks)
        end
    private
        def package_params
            params.permit({:dependencies => []},{:devDependencies => []})
        end
    private
        def title_params
            params.permit(:query)
        end
end
