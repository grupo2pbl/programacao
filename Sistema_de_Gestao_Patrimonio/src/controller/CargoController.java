
package controller;

import dao.CargoDAO;
import model.Cargo;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author e1000son
 */
public class CargoController {
    private CargoDAO cargoDAO;
    private List<Cargo> cargos;

    public CargoController() {
        cargoDAO = new CargoDAO();
        cargos = new ArrayList<>();
    }
    
    public boolean adicionar(String designacao){
        try {
            Cargo cargo = new Cargo();
            cargo.setDesignacao(designacao);
            return cargoDAO.adicionar(cargo);
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    
    public List<Cargo> getMateriais(){
        cargos = cargoDAO.listarCargos();
        return cargos;
    }
    
    public Cargo procurarPorId(int id){
        Cargo cm = cargoDAO.procuraPorId(id);
        return cm;
    }
}
