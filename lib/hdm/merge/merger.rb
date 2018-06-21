# frozen_string_literal: true

module HDM
  module Merge
    class Merger
      def update_profile(profile_or_id)
        profile = profile(profile_or_id)
        unmerged = profile.resources.where(merged: false)
        unmerged.each do |resource|
          merge(resource, profile)
        end
      end

      def merge(resource, profile)
        if resource.resource_type == 'Patient'
          merge_patient(resource, profile)
          return
        end
        matcher = matcher(resource.resource_type)
        relationship = model_relationship(resource.resource_type, profile)
        matches = matcher.match(resource.resource, relationship)

        if matches.present?
          deconflictor(resource.resource_type).deconflict(resource, matches)
        else
          obj = relationship.build(resource: resource.resource)
          obj.save
          # TODO: Add logging if this fails and some sort of recovery
          resource.merged = true
          resource.save
        end
      end

      def merge_patient(resource, _profile)
        ## TODO: Implement merging of patient demographics into profile
        return if resource.resource_type != 'Patient'
        resource.merged = true
        resource.save
      end

      private

      def model_relationship(resource_type, profile)
        profile.send resource_type.pluralize.to_sym
      end

      def resource_model(resource_type)
        Object.get_const(resource_type.classify)
      end

      def matcher(_resource_type)
        GenericMatcher
      end

      def deconflictor(_resource_type)
        GenericMatcher
      end

      def profile(profile_or_id)
        if profile_or_id.instance_of? Profile
          profile_or_id
        else
          Profile.find(profile_or_id)
        end
      end
    end
  end
end
