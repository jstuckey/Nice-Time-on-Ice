class PuckOnNetLinkPresenter < LinkPresenterBase
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
    %W[
      http://www.puckon.net/index.php?f=0&s=#{season.year_start}-09-01&e=#{season.year_end}-06-30&l=82&p=0
      http://www.puckon.net/corsi.php?f=0&s=2017-09-01&e=#{season.year_end}-06-30&l=82&p=0
      http://www.puckon.net/fenwick.php?f=0&s=#{season.year_start}-09-01&e=#{season.year_end}-06-30&l=82&p=0
      http://www.puckon.net/shots.php?f=0&s=#{season.year_start}-09-01&e=#{season.year_end}-06-30&l=82&p=0
      http://www.puckon.net/goals.php?f=0&s=#{season.year_start}-09-01&e=#{season.year_end}-06-30&l=82&p=0
      http://www.puckon.net/misses.php?f=0&s=#{season.year_start}-09-01&e=#{season.year_end}-06-30&l=82&p=0
      http://www.puckon.net/blocks.php?f=0&s=#{season.year_start}-09-01&e=#{season.year_end}-06-30&l=82&p=0
      http://www.puckon.net/hits.php?f=0&s=#{season.year_start}-09-01&e=#{season.year_end}-06-30&l=82&p=0
    ]
  end
end
