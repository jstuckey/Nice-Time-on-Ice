require 'test_helper'

class BehindTheNetLinkPresenterTest < ActiveSupport::TestCase
  def setup
    context = RequestContext.new(
      season: seasons(:fourteen),
      team: teams(:caps),
      game: games(:game_one),
      game_type: "regular"
    )

    @subject = BehindTheNetLinkPresenter.new(context)
  end

  test "#names returns a list of BTN page names for the game/team/season" do
    actual_names = @subject.names
    expected_names.zip(actual_names) do |expected_name, actual_name|
      assert_equal expected_name, actual_name
    end
  end

  test "#links returns a list of BTN links for the game/team/season" do
    actual_links = @subject.links
    expected_links.zip(actual_links) do |expected_link, actual_link|
      assert_equal expected_link, actual_link
    end
  end

  def expected_names
    [
      "Player Breakdown",
      "Player Shooting",
      "Linemates"
    ]
  end

  def expected_links
    %w[
      http://www.behindthenet.ca/nhl_statistics.php?ds=29&f1=2014_s&f2=5v5&f5=WSH&c=0+3+4+6+7+8+29+30+31+13+14+15+16+11+12+34+32+33+35+36+17+18+19+20+21+22+25+26+27+28+10+37+38+39+40+47+48+49+50+51+52+53+54+55+56+63+67+57+58+59+60+61+62+64+65+66+41+42+43+44+45+46
      http://www.behindthenet.ca/nhl_shot_statistics.php?ds=13&f1=2014_s&f2=5v5&f5=WSH&c=0+1+3+5+4+7+8+9+10+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28
      http://www.behindthenet.ca/nhl_time_on_ice_stats.php?ds=8&f1=2014_s&f2=5v5&f5=WSH&c=0+1+3+5+8+9+10+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28
    ]
  end
end
