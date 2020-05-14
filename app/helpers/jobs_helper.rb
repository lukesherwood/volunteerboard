module JobsHelper
    def locations
        Job.all.map{|job| job.location}.uniq!.compact
    end
end
