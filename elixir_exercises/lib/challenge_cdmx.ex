defmodule ChallengeCdmx do
  import  SweetXml
  def getLines(doc) do
   doc
   |> xpath(~x"//Folder[name='Líneas de Metro']/Placemark/name/text()"l)
   |> Enum.map(fn l -> List.to_string(l) end)
  end

  def getLineDescription(doc, line) do
    doc|> xpath(~x"//Folder[name='Líneas de Metro']/Placemark[name='#{line}']/LineString/coordinates/text()"s)
    |> String.replace("\n          ", "")
    |> String.split("  ", trim: true)
    |> Enum.map(fn coord -> %{getStation(doc, coord) => coord} end)
  end

  def getStation(doc, coordinate) do
    doc
    |> xpath(~x"//Folder[name='Estaciones de Metro']/Placemark/Point[contains(coordinates,'#{coordinate}')]/preceding-sibling::*[3]/text()"l)
    |> List.to_string()
  end

  def getLinesDescription(doc) do
    getLines(doc)
    |> Enum.map(fn line -> %{line => getLineDescription(doc, line)}end)
  end

  def firstPhase() do
    {:ok, doc} = File.read("./lib/data/Metro_CDMX.kml")
    getLinesDescription(doc)
  end

end
