import com.zdh.bean.Item;
import com.zdh.mappers.ItemMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class MybatisG {

    @Test
    public void Test01() throws IOException, XMLParserException, InvalidConfigurationException, SQLException, InterruptedException {
        List<String> warnings = new ArrayList<>();
        boolean overwrite = true;
        File config = new File("D:\\java\\TwoHanded\\src\\main\\resource\\MG.xml");
        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration configuration = cp.parseConfiguration(config);
        DefaultShellCallback callBack = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(configuration,callBack,warnings);
        myBatisGenerator.generate(null);
    }

    @Test
    public void Test02() throws IOException {
        InputStream resourceAsStream = Resources.getResourceAsStream("mybatis.xml");
        SqlSessionFactory build = new SqlSessionFactoryBuilder().build(resourceAsStream);
        SqlSession sqlSession = build.openSession();
        ItemMapper itemMapper = sqlSession.getMapper(ItemMapper.class);
        List<Item> items = itemMapper.selectAll();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        for (Item item :
                items) {
            Date publish_time = item.getPublish_time();
            String format = simpleDateFormat.format(publish_time);
            item.setSerial_num(format+item.getPublisher());
            System.out.println(item.getSerial_num());
            itemMapper.updateByPrimaryKey(item);
        }
        sqlSession.commit();
    }

    @Test
    public void Test03(){
        Map map = new HashMap();
        map.get("11111");
        System.out.println(map);
    }
}
