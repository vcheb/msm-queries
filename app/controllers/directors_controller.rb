class DirectorsController < ApplicationController
  def index
    render({:template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("an_id")
    matching_records = Director.where ({:id=>the_id})
    @the_director = matching_records.at(0)
    render ({:template=>"director_templates/details"})
  end

  def max_dob
    directors_by_dob_desc = Director.all.where.not({ :dob => nil }).order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.all.where.not({ :dob => nil }).order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end
end
