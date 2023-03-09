# frozen_string_literal: true

module Brcobranca
  module Util
    class Security
      def self.apply_password(document:, boleto:, key_length: 128)
        return unless boleto.usa_senha?

        document.security do |sec|
          sec.owner_password = boleto.senha_proprietario
          sec.user_password = boleto.senha_usuario
          sec.key_length = key_length
          sec.disable :print, :modify, :annotate, :interactive, :assemble # Temporário enquanto Rghost não corrige o .disable
        end
      end
    end
  end
end
