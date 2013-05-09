module DateFilter
  def self.included(base)
    base.extend ClassMethods
  end
  module ClassMethods
    def act_as_date_filter
      scope :filterize , ->(params){
        try{|ar|
        (params[:from].blank? == false and params[:to].blank? == false ) == true ? ar.where(:created_at => (params[:from].to_time(:local).beginning_of_day)..(params[:to].to_time(:local).end_of_day) ) : ar

          }.order('created_at DESC')
      }      
    end
  end
end
ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)
ActiveRecord::Base.send(:include, DateFilter)

