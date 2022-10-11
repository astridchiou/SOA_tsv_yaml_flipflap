# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  NEWLINE = "\n"
  TAB = "\t"

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    tsv_lines = tsv.split(NEWLINE)
    keys = tsv_lines[0].split(TAB)
    values = tsv_lines.drop(1).map { |line| line.split(TAB) }
    @data = values.map { |arr| keys.zip(arr).to_h }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    header = @data[0].keys.join(TAB) # take the first data's keys
    lines = @data.map { |datapoint| datapoint.values.join(TAB) }
    lines.unshift(header).join(NEWLINE) + NEWLINE
  end
end
