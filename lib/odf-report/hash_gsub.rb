module ODFReport

  module HashGsub

    def hash_gsub!(_text, hash_of_values)
      hash_of_values.each do |key, val|
        txt = html_escape(val)
        txt = odf_linebreak(txt)
        _text.gsub!("[#{key.to_s.upcase}]", txt)
      end
    end

    HTML_ESCAPE = { '&' => '&amp;',  '>' => '&gt;',   '<' => '&lt;', '"' => '&quot;' }

    def html_escape(s)
      return "" unless s
      s.to_s.gsub(/[&"><]/) { |special| HTML_ESCAPE[special] }
    end

    def odf_linebreak(s)
      return "" unless s
      s.to_s.gsub("\n", "<text:line-break/>")
    end

  end

end