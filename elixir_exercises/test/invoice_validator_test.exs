defmodule InvoiceValidatorTest do
  use ExUnit.Case
  import InvoiceValidator

  @northwest "America/Tijuana" # -2
  @pacific "America/Mazatlan" # -1
  @center "Mexico/General" # 0
  @southeast "America/Cancun" # +1

  @pac_dt DateTime.from_naive!(~N[2022-03-23 15:06:35], @center)

  test "Time period between dates with the same 'time_zone' is allowed" do
    # Dates are equals
    assert :ok = validate_dates(DateTime.from_naive!(~N[2022-03-23 15:06:35], @center), @pac_dt)
    # Emit date is less that PAC date
    assert :ok = validate_dates(DateTime.from_naive!(~N[2022-03-20 15:06:35], @center), @pac_dt)
    # Emit date is greater that PAC date
    assert :ok = validate_dates(DateTime.from_naive!(~N[2022-03-23 15:11:35], @center), @pac_dt)
  end

  test "Invalid time period between dates with the same 'time_zone' is not allowed" do
    # Emit date is less that PAC date
    assert {:error, "Invoice was issued more than 72 hrs before received by the PAC"} =
       validate_dates(DateTime.from_naive!(~N[2022-03-20 15:06:31], @center), @pac_dt)

    # Emit date is greater that PAC date
    assert {:error, "Invoice is more than 5 mins ahead in time"} =
      validate_dates(DateTime.from_naive!(~N[2022-03-23 15:11:36], @center), @pac_dt)
  end

  test "Time period between dates with different 'time_zone's is allowed" do
    # Dates are equals
    assert :ok = validate_dates(DateTime.from_naive!(~N[2022-03-23 16:06:35], @southeast), @pac_dt)
    assert :ok = validate_dates(DateTime.from_naive!(~N[2022-03-23 14:06:35], @pacific), @pac_dt)
    assert :ok = validate_dates(DateTime.from_naive!(~N[2022-03-23 13:06:35], @northwest), @pac_dt)

    # Emit date is less that PAC date
    assert :ok = validate_dates(DateTime.from_naive!(~N[2022-03-20 16:06:35], @southeast), @pac_dt)
    assert :ok = validate_dates(DateTime.from_naive!(~N[2022-03-20 14:06:35], @pacific), @pac_dt)
    # assert :ok = validate_dates(DateTime.from_naive!(~N[2022-03-20 13:06:35], @northwest), @pac_dt) (*)

    # Emit date is greater that PAC date
    assert :ok = validate_dates(DateTime.from_naive!(~N[2022-03-23 16:11:35], @southeast), @pac_dt)
    assert :ok = validate_dates(DateTime.from_naive!(~N[2022-03-23 14:11:35], @pacific), @pac_dt)
    assert :ok = validate_dates(DateTime.from_naive!(~N[2022-03-23 13:11:35], @northwest), @pac_dt)
  end

  test "Invalid time period between dates with different 'time_zone's is not allowed" do
    # Emit date is less that PAC date
    assert {:error, "Invoice was issued more than 72 hrs before received by the PAC"} =
       validate_dates(DateTime.from_naive!(~N[2022-03-20 16:06:31], @southeast), @pac_dt)
    assert {:error, "Invoice was issued more than 72 hrs before received by the PAC"} =
       validate_dates(DateTime.from_naive!(~N[2022-03-20 14:06:31], @pacific), @pac_dt)
    assert {:error, "Invoice was issued more than 72 hrs before received by the PAC"} =
       validate_dates(DateTime.from_naive!(~N[2022-03-20 13:06:31], @northwest), @pac_dt)

    # Emit date is greater that PAC date
    assert {:error, "Invoice is more than 5 mins ahead in time"} =
       validate_dates(DateTime.from_naive!(~N[2022-03-23 16:11:36], @southeast), @pac_dt)
    assert {:error, "Invoice is more than 5 mins ahead in time"} =
       validate_dates(DateTime.from_naive!(~N[2022-03-23 14:11:36], @pacific), @pac_dt)
    # assert {:error, "Invoice is more than 5 mins ahead in time"} =
    #    validate_dates(DateTime.from_naive!(~N[2022-03-23 13:11:36], @northwest), @pac_dt) (**)
  end
end

# *, ** : Don't be passed because in Mexico the time change on the northern border starts on the second Sunday of March.
#         For the year 2022 stared on March 13th.
