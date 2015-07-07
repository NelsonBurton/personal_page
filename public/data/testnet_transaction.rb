# testnet_transaction.rb
$:.unshift( File.expand_path("../../lib", __FILE__) )
require 'bitcoin'
require 'ap'
require 'open-uri'
# specify testnet network, alternatively use :bitcoin to use bitcoin network
Bitcoin::network = :testnet3
HELLO_WORLD_FROM_NELSON = "48454c4c4f5f574f524c445f46524f4d5f4e454c534f4e"

prev_hash = "13a8cf532bb0485feeb6ef4596e6476c182a92519dabb745eb4bde475f267475"
prev_tx = Bitcoin::P::Tx.from_json(open("http://test.webbtc.com/tx/#{prev_hash}.json"))

prev_out_index = 1
keySender = Bitcoin::Key.new("9baf399f185279928a965b0c6fe1eb1c19a6292d1c8ffcf41dda8f234665782a", nil, compressed: false)
toAddress = "mnwpcUh76eLVYzEXCuh4fypzABEtygqFR5"

include Bitcoin::Builder

new_tx = build_tx do |t|
  t.input do |i|
    i.prev_out prev_tx
    i.prev_out_index prev_out_index
    i.signature_key keySender
  end
  t.output do |o|
    o.value 69000000 # 70 million satoshi = .7 BTC, leave 1 million satoshi as fee
    o.to toAddress
  end
  t.output do |o|
      o.to HELLO_WORLD_FROM_NELSON, "op_return" # 70 million satoshi = .7 BTC
  end
end

f = File.new("op_return_tx.json", 'w+')
f.write(new_tx.to_json)
f.close

p "Transaction successfully generated"