module AtTaqwaARExt
  def self.included(base)
    base.extend ClassMethods
  end
  module ClassMethods
    def act_as_date_filter
      scope :filterize , ->(params){
        try{|ar|
        (params[:from].blank? == false and params[:to].blank? == false ) == true ? ar.where(:created_at => (params[:from].to_time(:local).beginning_of_day)..(params[:to].to_time(:local).end_of_day) ) : ar

          }
      }      
    end
    def act_as_group_by_date
      scope :group_by_date, ->{
        adptr = ActiveRecord::Base.connection.adapter_name
        if adptr =~ /postgresql/i
          group("DATE_TRUNC('day', #{self.table_name}.created_at)").order("date_trunc_day_#{self.table_name}_created_at asc")
        else
          group("date(#{self.table_name}.created_at)").order("created_at asc")
        end
      } 
      scope :latest , -> {
        order('created_at DESC')
      }   
    end
  end
end
Time.class_eval do
  def to_js_timestamp
    (self.to_f*1000).to_i
  end
end
ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)
ActiveRecord::Base.send(:include, AtTaqwaARExt)

