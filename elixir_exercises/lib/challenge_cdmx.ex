defmodule ChallengeCdmx do
  import SweetXml
  import Graph

  defmodule Line do
    defstruct name: "", stations: []
  end

  defmodule Station do
    defstruct name: "", coordinates: ""
  end

  def getLines(doc) do
   doc
   |> xpath(~x"//Folder[name='Líneas de Metro']/Placemark/name/text()"l)
   |> Enum.map(fn l -> List.to_string(l) end)
  end

  def getLineDescription(doc, line) do
    doc|> xpath(~x"//Folder[name='Líneas de Metro']/Placemark[name='#{line}']/LineString/coordinates/text()"s)
    |> String.replace("\n          ", "")
    |> String.split("  ", trim: true)
    |> Enum.map(fn coord -> %Station{name: getStation(doc, coord), coordinates: coord} end)
  end

  def getStation(doc, coordinate) do
    doc
    |> xpath(~x"//Folder[name='Estaciones de Metro']/Placemark/Point[contains(coordinates,'#{coordinate}')]/preceding-sibling::*[3]/text()"l)
    |> List.to_string()
  end

  def getLinesDescription(doc) do
    getLines(doc)
    |> Enum.map(fn line -> %Line{name: line, stations: getLineDescription(doc, line)}end)
  end

  def firstPhase() do
    {:ok, doc} = File.read("./lib/data/Metro_CDMX.kml")
    getLinesDescription(doc)
  end

  def generateGraph(g, [_ | []]), do: g
  def generateGraph(g, [h | t]) do
    g = add_edge(g, h.name , hd(t).name)
    generateGraph(g, t)
  end

  def secondPhase() do
    g = new(type: :undirected)
    firstPhase()
    |> Enum.reduce(g, fn line, g ->  generateGraph(g, line.stations) end)
  end

end
