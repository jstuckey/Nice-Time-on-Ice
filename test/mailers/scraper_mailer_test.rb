require 'test_helper'

class ScraperMailerTest < ActionMailer::TestCase
  test "results email should be setup correctly" do
    email = ScraperMailer.results_email([])
    assert_equal ["laichitor.lumpit@gmail.com"], email.to
    assert_equal ["scraper@nicetimeonice.com"], email.from
    assert_equal "Scraping Results", email.subject
  end

  test "email body should include passed results" do
    results = ["Saved game 123", "Error saving game 456"]
    email = ScraperMailer.results_email(results)

    body_enumerator(email).each do |body|
      assert_match(/Saved game 123/, body)
      assert_match(/Error saving game 456/, body)
    end
  end

  private

  def body_enumerator(email)
    email.body.parts.map(&:body).map(&:to_s)
  end
end
