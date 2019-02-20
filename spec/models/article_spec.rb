# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  it { 
    is_expected.to have_db_column(:title)
    .of_type(:string) 
  }
  it { 
    is_expected.to have_db_column(:content)
    .of_type(:text) 
  }
end
