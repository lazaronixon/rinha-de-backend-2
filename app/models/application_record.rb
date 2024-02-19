class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  connects_to shards: {
    default:     { writing: :primary,             reading: :primary },
    shard_one:   { writing: :primary_shard_one,   reading: :primary_shard_one },
    shard_two:   { writing: :primary_shard_two,   reading: :primary_shard_two },
    shard_three: { writing: :primary_shard_three, reading: :primary_shard_three },
    shard_four:  { writing: :primary_shard_four,  reading: :primary_shard_four },
    shard_five:  { writing: :primary_shard_five,  reading: :primary_shard_five }
  }
end
