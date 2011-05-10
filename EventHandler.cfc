/**
 * @implements cfide.orm.IEventHandler
 */
component {

	public void function preLoad(any entity) {

		coldmvc.factory.autowire(arguments.entity);

	}

	public void function postLoad(any entity) {

	}

	public void function preInsert(any entity) {

	}

	public void function postInsert(any entity) {

	}

	public void function preUpdate(any entity, struct oldData) {

	}

	public void function postUpdate(any entity) {
	}

	public void function preDelete(any entity) {

	}

	public void function postDelete(any entity) {

	}

}