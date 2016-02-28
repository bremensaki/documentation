require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:local_domain) { 'local.tld' }

  before do
    stub_const('LOCAL_DOMAIN', local_domain)
  end

  describe '#unique_tag' do
    it 'returns a string' do
      expect(helper.unique_tag(Time.now, 12, 'Status')).to be_a String
    end
  end

  describe '#unique_tag_to_local_id' do
    it 'returns the ID part' do
      expect(helper.unique_tag_to_local_id("tag:#{local_domain};objectId=12:objectType=Status", 'Status')).to eql '12'
    end
  end

  describe '#local_id?' do
    it 'returns true for a local ID' do
      expect(helper.local_id?("tag:#{local_domain};objectId=12:objectType=Status")).to be true
    end

    it 'returns false for a foreign ID' do
      expect(helper.local_id?('tag:foreign.tld;objectId=12:objectType=Status')).to be false
    end
  end

  describe '#add_base_url_prefix' do
    it 'returns full API URL from base to suffix' do
      expect(helper.add_base_url_prefix('test')).to eql "#{root_url}api/test"
    end
  end

  describe '#profile_url' do
    pending
  end

  describe '#status_url' do
    pending
  end
end