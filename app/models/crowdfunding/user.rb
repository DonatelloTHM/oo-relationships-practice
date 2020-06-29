
class User
    attr_reader :name
    @@all=[]

    def initialize(name)
        @name=name
        @@all<<self
    end

    def new_pledge(project,amount)
        Pledge.new(project,self,amount)
    end
    def self.all
        @@all
    end

    def self.highest_pledge
        Pledge.all.max_by{|users| users.amount}

    end

    def self.multi_pledger
        all_users=Pledge.all.map{|pledges| pledges.user}
        all_users.max_by{|users| all_users.count(users)}

    end

    def self.project_creator
        Pledge.all.select{|pledges| pledges.project.creator
        }.map{|creators|creators.project.creator}.uniq

    end
end