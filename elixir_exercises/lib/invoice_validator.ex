defmodule InvoiceValidator do
  def validate_dates(emisor_dt, pac_dt) do
    case DateTime.compare(emisor_dt, pac_dt) do
      :eq -> :ok
      :lt ->
        if DateTime.diff(pac_dt, emisor_dt, :second) <= (72 * 60 * 60) do
          :ok
        else
          {:error, "Invoice was issued more than 72 hrs before received by the PAC"}
        end
      :gt ->
        if DateTime.diff(emisor_dt, pac_dt, :second) <= (5 * 60) do
          :ok
        else
          {:error, "Invoice is more than 5 mins ahead in time"}
        end
    end
  end
end
