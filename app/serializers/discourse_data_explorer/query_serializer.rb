# frozen_string_literal: true

module ::DiscourseDataExplorer
  class QuerySerializer < ActiveModel::Serializer
    attributes :id,
               :sql,
               :name,
               :description,
               :param_info,
               :created_at,
               :username,
               :group_ids,
               :last_run_at,
               :hidden,
               :user_id

    def param_info
      object&.params&.uniq { |p| p.identifier }&.map(&:to_hash)
    end

    def username
      object&.user&.username
    end

    def group_ids
      object.groups.map(&:id)
    end
  end
end
