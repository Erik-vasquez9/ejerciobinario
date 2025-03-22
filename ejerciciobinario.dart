class Empleado {
  int id;
  String nombre;

  Empleado(this.id, this.nombre);
}

class Nodo {
  Empleado empleado;
  Nodo? izquierdo;
  Nodo? derecho;

  Nodo(this.empleado);
}

class ArbolBinario {
  Nodo? raiz;

  void insertar(int id, String nombre) {
    Empleado nuevoEmpleado = Empleado(id, nombre);
    raiz = _insertarRecursivo(raiz, nuevoEmpleado);
  }

  Nodo _insertarRecursivo(Nodo? nodo, Empleado empleado) {
    if (nodo == null) {
      return Nodo(empleado);
    }
    if (empleado.id < nodo.empleado.id) {
      nodo.izquierdo = _insertarRecursivo(nodo.izquierdo, empleado);
    } else {
      nodo.derecho = _insertarRecursivo(nodo.derecho, empleado);
    }
    return nodo;
  }

  void preorden() {
    _preordenRecursivo(raiz);
    print("");
  }

  void _preordenRecursivo(Nodo? nodo) {
    if (nodo != null) {
      print("${nodo.empleado.id}: ${nodo.empleado.nombre}");
      _preordenRecursivo(nodo.izquierdo);
      _preordenRecursivo(nodo.derecho);
    }
  }

  void inorden() {
    _inordenRecursivo(raiz);
    print("");
  }

  void _inordenRecursivo(Nodo? nodo) {
    if (nodo != null) {
      _inordenRecursivo(nodo.izquierdo);
      print("${nodo.empleado.id}: ${nodo.empleado.nombre}");
      _inordenRecursivo(nodo.derecho);
    }
  }

  void postorden() {
    _postordenRecursivo(raiz);
    print("");
  }

  void _postordenRecursivo(Nodo? nodo) {
    if (nodo != null) {
      _postordenRecursivo(nodo.izquierdo);
      _postordenRecursivo(nodo.derecho);
      print("${nodo.empleado.id}: ${nodo.empleado.nombre}");
    }
  }
}

void main() {
  ArbolBinario arbol = ArbolBinario();
  arbol.insertar(50, "Director General");
  arbol.insertar(30, "Gerente de Tecnología");
  arbol.insertar(70, "Gerente de Finanzas");
  arbol.insertar(20, "Desarrollador");
  arbol.insertar(40, "Diseñador");
  arbol.insertar(60, "Contador");
  arbol.insertar(80, "Analista");

  print("Recorrido Preorden:");
  arbol.preorden();

  print("Recorrido Inorden:");
  arbol.inorden();

  print("Recorrido Postorden:");
  arbol.postorden();
}
