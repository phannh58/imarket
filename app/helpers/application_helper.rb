module ApplicationHelper
  def set_param_image_base_64 image_64
    image_64 = "data:image/png;base64," << image_64.gsub(/\r\n/, "") if image_64
  end

  def set_param_xml_base_64 xml_64
    xml_64 = "data:text/xml;base64," << xml_64.gsub(/\r\n/, "") if xml_64
  end
end
