require "ohm"
require "ohm/contrib"

class NilClass
  def empty?; true; end
end

class Persona < Ohm::Model
  include Ohm::Typecast

  attribute :cuit
  attribute :nombre
  attribute :razon_social
  attribute :tipo_social
  attribute :personeria
  attribute :telefono
  attribute :movil
  attribute :fax
  attribute :email
  attribute :url
  attribute :tipo_pyme

  attribute :calle
  attribute :localidad
  attribute :codigo_postal
  attribute :provincia

  attribute :sources, Array

  index :cuit

  def validate
    assert_unique :cuit
  end

  def cuit=(value)
    value = value.gsub(/[^\d]/, '') unless value.empty?
    write_local(:cuit, value)
  end

  def url=(value)
    unless value.empty?
      value = "http://#{value}" unless value =~ /^https?:\/\//
      value = value.downcase
    end

    write_local(:url, value)
  end

  def email=(value)
    value = value.downcase unless value.empty?
    write_local(:email, value)
  end

  def to_hash
    super.merge(attributes.inject({}) { |attrs, name|
      attrs[name] = self.send(name)
      attrs
    })
  end

  def self.pending
    key[:pending]
  end
end
