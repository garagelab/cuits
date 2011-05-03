require "cuba"
require "json"

require "./app"

Cuba.define do
  on "cuits/:cuit"  do |cuit|
    persona = Persona.find(cuit: cuit).first
    res.headers["Content-Type"] = "application/json; charset=utf-8"
    res.write JSON.pretty_generate(persona)
  end
end

run Cuba.app
