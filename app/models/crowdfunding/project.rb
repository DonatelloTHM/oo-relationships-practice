class Project
    attr_reader :name, :goal, :creator
    @@all=[]

    def initialize(name,creator,goal)
        @name=name
        @goal=goal
        @creator=creator
        @@all<<self

    end

    def new_pledge(user,amount)
        Pledge.new(self,user,amount)
    end
    def self.all
        @@all
    end
    def self.get_all_projects
        Pledge.all.map{|pledges| pledges.project}
    end
    def self.get_all_projects_uniq
        self.get_all_projects.uniq
    end
    def self.no_pledges
        self.all.select{|project| !self.get_all_projects_uniq.include?(project)}
    end

    def self.project_total_pledge(project)
        Pledge.all.select{|pledges| pledges.project==project
        }.reduce(0){|total,pledges_amount| total+=pledges_amount.amount}


    end

    def self.above_goal
        self.get_all_projects_uniq.select{
            |project_check| self.project_total_pledge(project_check) >= project_check.goal}


    end
    def self.most_backers
        highest_backers=self.get_all_projects
        highest_backers.max_by{|proj| highest_backers.count(proj)}
    end
end