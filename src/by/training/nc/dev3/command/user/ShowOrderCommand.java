package by.training.nc.dev3.command.user;


import by.training.nc.dev3.beans.BlackList;
import by.training.nc.dev3.beans.Goods;
import by.training.nc.dev3.beans.Order;
import by.training.nc.dev3.beans.UserProfile;
import by.training.nc.dev3.command.ActionCommand;
import by.training.nc.dev3.constants.Parameters;
import by.training.nc.dev3.dao.*;
import by.training.nc.dev3.resource.ConfigurationManager;
import by.training.nc.dev3.resource.LocaleManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

public class ShowOrderCommand implements ActionCommand {
    @Override
    public String execute(HttpServletRequest request) {
        String page = null;
        try {
            HttpSession session = request.getSession();
            String login = String.valueOf(session.getAttribute("user"));
            int idUser = new UserDAO().getUserIdByName(login);
            UserProfile profil = new UserProfileDAO().getEntityById(idUser);
            if (profil != null) {
                Order order = new OrderDAO().getOrderByIdUser(new UserDAO().getUserIdByName(login));
                BlackListDAO blackListDAO = new BlackListDAO();
                BlackList blackList = blackListDAO.getEntityById(idUser);
                if (blackList.getUserId() != 0) {
                    LocaleManager.setBundle((Locale) session.getAttribute("locale"));
                    session.setAttribute("userBlackList", new String((LocaleManager.getProperty("message.userBlackList").getBytes("ISO-8859-1")), "Cp1251"));
                }
                if (order.getOrderId() != 0) {
                    List<Goods> goods = null;
                    if (order.getStatus() == false) {
                        goods = new GoodsOrderDAO().getAllById(order.getOrderId());
                        session.setAttribute(Parameters.ORDER_LIST, goods);
                        session.setAttribute(Parameters.ORDER_COST, order.getOrderCost());
                    } else {
                        session.setAttribute(Parameters.ORDER_COST, 0);
                        session.setAttribute(Parameters.GOODS_ORDER, 0);
                    }
                }
                page = ConfigurationManager.getProperty("path.page.showOrder");
            } else
                page = ConfigurationManager.getProperty("path.page.adminProfile");
        } catch (SQLException e) {
            System.out.println("SQLException");
        } catch (UnsupportedEncodingException e) {
            System.out.println("Encoding exception");
        }
        return page;
    }
}
