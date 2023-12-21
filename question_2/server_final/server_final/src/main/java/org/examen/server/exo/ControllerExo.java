package org.examen.server.exo;

import org.examen.exception.NombresEgaux;
import org.examen.exception.TropCourt;
import org.examen.transfer.RequeteErrorOrNot;
import org.examen.transfer.RequetePlusGrand;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

// This is JAX-RS Jersey style annotations
// Can be mixed with Spring Security security
// And can used Autowired Services too
@Controller
public class ControllerExo {

	/**
	 * Tester votre serveur
	 * @return
	 */
	@GetMapping("/test")
	public @ResponseBody String test() {
		return "SALUT";
	}

	@PostMapping("/exos/error/or/not/")
	public @ResponseBody String errorOrNot(@RequestBody RequeteErrorOrNot req) throws TropCourt {

		if (req.nom.length() < 5) throw new TropCourt();

		return"Yeah!!!";
	}

	@PostMapping("/examen/plusgrand/")
	public @ResponseBody int plusGrand(@RequestBody RequetePlusGrand req) throws Exception {

		if(req.val1 > req.val2) {
			return req.val1;
		} else if(req.val2 > req.val1)
			return req.val2;
		else throw new NombresEgaux();
	}


}
