# Constructs links to Puck on Net
class PuckOnNetLinkPresenter < LinkPresenterBase
  LINK_BASE = "http://www.puckon.net/".freeze

  def names
    [
      "Team Stats",
      "Corsi",
      "Fenwick",
      "Shots",
      "Goals",
      "Misses",
      "Blocks",
      "Hits"
    ]
  end

  def links
    [
      team_stats,
      corsi,
      fenwick,
      shots,
      goals,
      misses,
      blocks,
      hits
    ]
  end

  def team_stats
    "#{LINK_BASE}index.php?f=0&s=#{season.year_start}-09-01&e=" \
      "#{season.year_end}-06-30&l=82&p=0"
  end

  def corsi
    "#{LINK_BASE}corsi.php?f=0&s=2017-09-01&e=#{season.year_end}-06-30" \
      "&l=82&p=0"
  end

  def fenwick
    "#{LINK_BASE}fenwick.php?f=0&s=#{season.year_start}-09-01" \
      "&e=#{season.year_end}-06-30&l=82&p=0"
  end

  def shots
    "#{LINK_BASE}shots.php?f=0&s=#{season.year_start}-09-01" \
      "&e=#{season.year_end}-06-30&l=82&p=0"
  end

  def goals
    "#{LINK_BASE}goals.php?f=0&s=#{season.year_start}-09-01" \
      "&e=#{season.year_end}-06-30&l=82&p=0"
  end

  def misses
    "#{LINK_BASE}misses.php?f=0&s=#{season.year_start}-09-01" \
      "&e=#{season.year_end}-06-30&l=82&p=0"
  end

  def blocks
    "#{LINK_BASE}blocks.php?f=0&s=#{season.year_start}-09-01" \
      "&e=#{season.year_end}-06-30&l=82&p=0"
  end

  def hits
    "#{LINK_BASE}hits.php?f=0&s=#{season.year_start}-09-01" \
      "&e=#{season.year_end}-06-30&l=82&p=0"
  end
end
