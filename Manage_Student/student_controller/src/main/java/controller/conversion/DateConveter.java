package controller.conversion;

import org.springframework.core.convert.converter.Converter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConveter implements Converter<String, Date> {

    @Override
    public Date convert(String source) {
        try {
            if(null != source){//2016:11-05 11_43-50
                DateFormat df = new SimpleDateFormat("yyyy:MM-dd HH_mm-ss");
                return df.parse(source);
            }
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        return null;
    }
}
