package by.training.nc.dev3.command.factory;

import by.training.nc.dev3.command.ActionCommand;
import by.training.nc.dev3.command.admin.*;
import by.training.nc.dev3.command.customer.CustomerProfilePageCommand;
import by.training.nc.dev3.command.user.*;

public enum CommandEnum {
    LOGIN {
        {
            this.command = new LoginCommand();
        }
    },
    LOGINPAGE {
        {
            this.command = new LoginPageCommand();
        }
    },
    REGISTRATION {
        {
            this.command = new RegistrationCommand();
        }
    },
    REGISTRATIONPAGE {
        {
            this.command = new RegistrationPageCommand();
        }
    },
    ADMINPROFILEPAGE {
        {
            this.command = new AdminProfilePageCommand();
        }
    },
    EDITPAGE {
        {
            this.command = new AdminEditPageCommand();
        }
    },
    CUSTOMERPROFILEPAGE {
        {
            this.command = new CustomerProfilePageCommand();
        }
    },
    FILLPROFILE {
                {
                    this.command = new FillProfileCommand();
                }
            },
    EDIT_MAIN_DATA {
        {
            this.command = new EditMainDataCommand();
        }
    },
    SHOW_CUSTOMERS{
        {
            this.command = new ShowCustomersCommand();
        }
    },
    CATALOG{
        {
            this.command = new CatalogCommand();
        }
    },
    SHOW_GOODS{
        {
            this.command = new ShowGoodsCommand();
        }
    },
    MAKE_ORDER{
        {
            this.command = new MakeOrderCommand();
        }
    },
    SHOW_DESCRIPTION{
        {
            this.command = new ShowDescriptionCommand();
        }
    },
    REMOVE_ORDER{
        {
            this.command = new RemoveOrderCommand();
        }
    },
    UPDATE_ORDER{
        {
            this.command = new UpdateOrderCommand();
        }
    },
    BUY_ORDER{
        {
            this.command = new BuyOrderCommand();
        }
    },
    SHOW_ORDER{
        {
            this.command = new ShowOrderCommand();
        }
    },
    FIND_GOODS{
        {
            this.command = new FindGoodsCommand();
        }
    },
    SORT_BY_PRICE{
        {
            this.command = new SortPriceGoodsCommand();
        }
    },
    SHOP_MANAGEMENT{
        {
            this.command = new ShopManagementCommand();
        }
    },
    SHOW_PURCHASE_HISTORY{
        {
            this.command = new ShowPurchaseHistoryCommand();
        }
    },
    BLACK_LIST{
        {
            this.command = new BlackListCommand();
        }
    },
    ADD_BLACK_LIST{
        {
            this.command = new AddBlackListCommand();
        }
    },
    ADD_CATEGORY{
        {
            this.command = new AddCategoryCommand();
        }
    },
    UPDATE_CATEGORY{
        {
            this.command = new UpdateCategoryCommand();
        }
    },
    REMOVE_CATEGORY{
        {
            this.command = new RemoveCategoryCommand();
        }
    },
    ADD_GOODS{
        {
            this.command = new AddGoodsCommand();
        }
    },
    REMOVE_GOODS{
        {
            this.command = new RemoveGoodsCommand();
        }
    },
    UPDATE_GOODS{
        {
            this.command = new UpdateGoodsCommand();
        }
    },
    REMOVE_FROM_BLACKLIST{
        {
            this.command = new RemoveFromBlackListCommand();
        }
    },
    SELECT_LANGUAGE{
        {
            this.command = new SelectLanguageCommand();
        }
    },
    LOGOUT {
        {
            this.command = new LogoutCommand();
        }
    };
    ActionCommand command;

    public ActionCommand getCurrentCommand() {
        return command;
    }
}