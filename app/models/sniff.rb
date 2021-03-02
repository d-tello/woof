class Sniff < ApplicationRecord
  belongs_to :sniffer
  belongs_to :sniffed
end
