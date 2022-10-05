# frozen_string_literal: true

TAB = "\t"
NEWLINE = "\n"
# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = tsv.split(NEWLINE).map { |line| line.split(TAB) }
    header = @data.shift
    @data.map! { |row| header.zip(row).to_h }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    header = @data.first.keys.join(TAB)
    rows = @data.map { |row| row.values.join(TAB) }
    [header, rows].join(NEWLINE) + NEWLINE
  end
end
